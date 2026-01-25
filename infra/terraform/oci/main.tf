resource "oci_core_instance" "vm-oci" {
  availability_domain = local.ad_name
  fault_domain        = local.fd_name
  compartment_id      = var.compartment_id
  shape               = var.image_shape
  display_name        = "Homelab Instance"

  create_vnic_details {
    subnet_id        = var.subnet_id
    display_name     = "Homelab VNIC"
    assign_public_ip = true
  }

  source_details {
    source_id   = var.image_id
    source_type = "image"
  }

  metadata = {
    ssh_authorized_keys = local.ssh_key
  }
}
