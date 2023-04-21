resource "oci_identity_compartment" "asset_compartment" {
    compartment_id = "${var.parent_compartment}"
    name = var.compartment_name
    description = "compartment for Retail related resources"
    enable_delete = "true"
}
