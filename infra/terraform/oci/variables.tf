variable "compartment_id" {
  description = "OCI tenancy OCID"
  type        = string
}

variable "region" {
  description = "OCI tenancy region"
  type        = string
}

variable "image_shape" {
  description = "VM instance shape"
  type        = string
}

variable "subnet_id" {
  description = "VM instance subnet ID"
  type        = string
}

variable "image_id" {
  description = "VM instance image ID"
  type        = string
}

data "oci_identity_availability_domains" "ads" {
  compartment_id = var.compartment_id
}

data "oci_identity_fault_domains" "fds" {
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
  compartment_id      = var.compartment_id
}

locals {
  ssh_key = file("~/.ssh/key.pub")
  ad_name = data.oci_identity_availability_domains.ads.availability_domains[0].name
  fd_name = data.oci_identity_fault_domains.fds.fault_domains[2].name
}
