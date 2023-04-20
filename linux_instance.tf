resource "oci_core_instance" "linux" {
  count               = "1"
 availability_domain = lookup(data.oci_identity_availability_domains.ads.availability_domains[0],"name")
 compartment_id      = oci_identity_compartment.asset_compartment.id
  display_name        = var.instance_name
  shape               = var.shape

  create_vnic_details {
    assign_public_ip = var.assign_public_ip
    display_name   = "primaryvnic"
    hostname_label = "linuxInstance"
    subnet_id      = oci_core_subnet.publicsubnet.id
  }
shape_config {

        #Optional
        memory_in_gbs = var.instance_shape_config_memory_in_gbs
        ocpus = var.instance_shape_config_ocpus
    }
  
  metadata = {
    ssh_authorized_keys = var.ssh_authorized_keys
  }

  source_details {
    boot_volume_size_in_gbs = var.boot_volume_size_in_gbs
    source_id               = var.instance_image_ocid[var.region]
    source_type             = "image"
  }
  timeouts {
    create = "60m"
  }
}

resource "oci_core_volume" "linux" {
  availability_domain = lookup(data.oci_identity_availability_domains.ads.availability_domains[0],"name")
  compartment_id      = oci_identity_compartment.asset_compartment.id
  display_name        = "asset_mgmt_Instance"
  size_in_gbs         = var.boot_volume_size_in_gbs
}

resource "oci_core_volume_attachment" "linux" {
  count           = "1"
  attachment_type = "iscsi"
  compartment_id  = oci_identity_compartment.asset_compartment.id
  instance_id     = oci_core_instance.linux[count.index].id
  volume_id       = oci_core_volume.linux.id
  use_chap        = true
}
