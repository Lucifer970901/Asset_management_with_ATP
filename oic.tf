resource "oci_integration_integration_instance" "test_integration_instance" {
    #Required
    compartment_id = oci_identity_compartment.asset_compartment.id
    display_name = var.integration_instance_display_name
    integration_instance_type = var.integration_instance_integration_instance_type
    is_byol = var.integration_instance_is_byol
    message_packs = var.integration_instance_message_packs
    idcs_at = file(tokens.tok)
}
