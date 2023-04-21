resource "oci_database_autonomous_database" "test_ATP_database" {
  admin_password               = var.atp_password
  compartment_id               = oci_identity_compartment.asset_compartment.id
  cpu_core_count               = var.database_cpu_core_count
  data_storage_size_in_tbs     = var.database_data_storage_size_in_tbs
  db_name                      = var.database_db_name
  display_name                 = var.database_display_name
  license_model                = var.database_license_model
  db_version                   = var.database_db_version
  db_workload                  = var.database_db_workload
}
