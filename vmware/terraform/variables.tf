variable "infranode_hostname" {
  type    = "string"
}

variable "infranode_ip" {
  type    = "string"
}

variable "infranode_vcpu" {
  type    = "string"
}

variable "infranode_memory" {
  type    = "string"
}

variable "infranode_vm_template" {
  type = "string"
}

variable "infranode_vm_os_user" {
  type = "string"
}

variable "infranode_vm_os_password" {
  type = "string"
}

variable "infranode_vm_ipv4_gateway" {
  type = "string"
}

variable "infranode_vm_ipv4_prefix_length" {
  type = "string"
}

variable "infranode_vm_disk1_size" {
  type    = "string"
}

variable "infranode_vm_disk1_datastore" {
  type = "string"
}

variable "infranode_vm_disk1_keep_on_remove" {
  type    = "string"
}

variable "infranode_vm_disk2_enable" {
  type    = "string"
}

variable "infranode_vm_disk2_size" {
  type    = "string"
}

variable "infranode_vm_disk2_datastore" {
  type    = "string"
}

variable "infranode_vm_disk2_keep_on_remove" {
  type    = "string"
  default = "false"
}

variable "vm_domain" {
  type = "string"
}

variable "vm_public_network_interface_label" {
  type = "string"
}

variable "vm_private_network_interface_label" {
  type = "string"
}

variable "vm_private_adapter_type" {
  type    = "string"
}

variable "vm_public_adapter_type" {
  type    = "string"
}

variable "vm_folder" {
  type = "string"
}

variable "vm_dns_servers" {
  type = "list"
}

variable "vm_dns_suffixes" {
  type = "list"
}

variable "vm_clone_timeout" {
  type = "string"
}

variable "vsphere_datacenter" {
  type = "string"
}

variable "vsphere_cluster" {
  type = "string"
}

variable "vsphere_resource_pool" {
  type = "string"
}

variable "infra_private_ssh_key" {
  type    = "string"
}

variable "infra_public_ssh_key" {
  type    = "string"
}

variable "nfs_link_folders" {
  type    = "string"
}

variable "enable_nfs" { 
  type = "string" 
}

variable "ocversion"{
  type = "string"
}

variable "ocp_cluster_domain" {
  type = "string"
}

variable "clustername" {
  type = "string"
}

variable "vsphere_datastore" {
  type        = "string"
}

variable "ocp_vm_template" {
  type        = "string"
}

variable "ocp_compute_vm_memory"{
  type        = "string"
}

variable "ocp_compute_vm_cpu"{
  type        = "string"
}

variable "ocp_compute_vm_disk_size"{
  type        = "string"
}

variable "ocp_boot_vm_memory"{
  type        = "string"
}

variable "ocp_boot_vm_cpu"{
  type        = "string"
}

variable "ocp_boot_vm_disk_size"{
  type        = "string"
}

variable "ocp_control_vm_memory"{
  type        = "string"
}

variable "ocp_control_vm_cpu"{
  type        = "string"
}

variable "ocp_control_vm_disk_size"{
  type        = "string"
}


variable "use_static_mac" {
  type = "string"
}

variable "mac_address_boot" {
  type = "list"
}

variable "mac_address_control" {
  type = "list"
}

variable "mac_address_compute" {
  type = "list"
}

variable "control_plane_count" {
  type = "string"
}

variable "compute_count" {
  type = "string"
}

variable "pullsecret" {
  type = "string"
}