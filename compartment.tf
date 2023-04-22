resource "oci_identity_compartment" "asset_compartment" {
    compartment_id = "${var.compartment_ocid}"
    name = var.compartment_name
    description = "compartment for Retail related resources"
    enable_delete = "true"
}
