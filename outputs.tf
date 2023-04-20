output "asset_compartment" {
  description = "The VCNs, indexed by display_name."
  value       = oci_identity_compartment.asset_compartment.name
}

output "vcn_id" {
value = oci_core_vcn.test_vcn.id
}
