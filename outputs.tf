output "asset_compartment" {
  description = "The VCNs, indexed by display_name."
  value       = oci_identity_compartment.asset_compartment.name
}

output "compartment id" {
  value = oci_identity_compartment.asset_compartment.id
}

output "vcn_id" {
value = oci_core_vcn.test_vcn.id
}

output "instance_id"{
value = "${oci_core_instance.linux.*.id}"
}

output "assigned_public_ip" {
 description = "Public IPs of created instances. "
 value       = "${oci_core_instance.linux.*.public_ip}"
}

output "ATP_database_id" {
  value = oci_database_autonomous_database.test_ATP_database.id
}

output "OIC id" {
  value = oci_integration_integration_instance.test_integration_instance.id
}
