resource "oci_identity_compartment" "asset_compartment" {
    compartment_id = "${var.parent_compartment}"
    name = "Asset_mgmt_solutions"
    description = "compartment for Retail related resources"
    enable_delete = "true"
}
