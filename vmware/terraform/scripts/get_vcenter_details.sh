#!/bin/bash

## Check if a command exists
function command_exists() {
    type "$1" &> /dev/null;
}

## Wait to obtain update lock
function wait_apt_lock()
{
    sleepC=5
    while [[ -f /var/lib/dpkg/lock  || -f /var/lib/apt/lists/lock ]]
    do
      sleep $sleepC
      echo "    Checking lock file /var/lib/dpkg/lock or /var/lib/apt/lists/lock"
      [[ `sudo lsof 2>/dev/null | egrep 'var.lib.dpkg.lock|var.lib.apt.lists.lock'` ]] || break
      let 'sleepC++'
      if [ "$sleepC" -gt "50" ] ; then
    lockfile=`sudo lsof 2>/dev/null | egrep 'var.lib.dpkg.lock|var.lib.apt.lists.lock'|rev|cut -f1 -d' '|rev`
        echo "Lock $lockfile still exists, waited long enough, attempt apt-get. If failure occurs, you will need to cleanup $lockfile"
        continue
      fi
    done
}

# Install the jq, depending upon the platform
function install_jq() {
    echo "Installing jq"
    if [[ $PLATFORM == *"ubuntu"* ]]; then
        wait_apt_lock
        sudo apt-get update -y
        wait_apt_lock
        sudo apt-get install -y jq
    elif [[ $PLATFORM == *"rhel"* ]]; then
    	sudo yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
        sudo yum -y install jq
    fi
}

if [[ `which jq` ]] ; then
	echo "jq already installed"
else
	echo "install jq"
	# Identify the platform and version using Python
	PLATFORM="unknown"
	if command_exists python; then
	    PLATFORM=`python -c "import platform;print(platform.platform())" | rev | cut -d '-' -f3 | rev | tr -d '".' | tr '[:upper:]' '[:lower:]'`
	    PLATFORM_VERSION=`python -c "import platform;print(platform.platform())" | rev | cut -d '-' -f2 | rev`
	else
	    if command_exists python3; then
	        PLATFORM=`python3 -c "import platform;print(platform.platform())" | rev | cut -d '-' -f3 | rev | tr -d '".' | tr '[:upper:]' '[:lower:]'`
	        PLATFORM_VERSION=`python3 -c "import platform;print(platform.platform())" | rev | cut -d '-' -f2 | rev`
	    fi
	fi
	if [[ $PLATFORM == *"redhat"* ]]; then
	    PLATFORM="rhel"
	fi	
	install_jq
fi

vcenter=`echo $VSPHERE_SERVER`
vcenteruser=`echo $VSPHERE_USER`
vcenterpassword=`echo $VSPHERE_PASSWORD`
jq -n --arg vcenter "$vcenter" --arg vcenteruser "$vcenteruser" --arg vcenterpassword "$vcenterpassword" '{"vcenter":$vcenter,"vcenteruser":$vcenteruser,"vcenterpassword":$vcenterpassword}'
