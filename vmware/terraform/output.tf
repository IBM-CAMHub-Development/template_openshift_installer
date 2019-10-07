locals {
  fqdn = "${element(keys(var.master_node_hostname_ip),0)}.${var.vm_domain_name}"
}

output "openshift_url" {
  value = "https://${local.fqdn}:8443"
}

output "cluster_name" {
  value = "${replace(local.fqdn,".","-")}"
}
output "openshift_user" {
  value = "${var.openshift_user}"
}

output "openshift_password" {
  value = "${var.openshift_password}"
}

output "openshift_master_ip" {
  value = "${element(values(var.master_node_hostname_ip),0)}"
}

output "openshift_master_hostname_ip" {
  value = "${element(var.master_node_hostname_ip,0)}"
}

output "openshift_infra_ip" {
  value = "${element(values(var.infra_node_hostname_ip),0)}"
}

output "openshift_compute1_hostname" {
  value = "${element(keys(var.compute_node_hostname_ip),0)}"
}

output "openshift_compute2_hostname_ip" {
  value = "${length(var.compute_node_hostname_ip) > 1 ? element(var.compute_node_hostname_ip,1) : ""}"
}

output "openshift_compute3_hostname" {
  value = "${length(var.compute_node_hostname_ip) > 2 ? element(keys(var.compute_node_hostname_ip),2) : ""}"
}