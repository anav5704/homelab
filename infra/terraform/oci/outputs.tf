output "vm_public_ip" {
  description = "VM Public IP"
  value       = oci_core_instance.vm-oci.public_ip
}
