variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "compartment_ocid" {}
variable "region" {}

variable "parent_compartment" {
  description = "parent compartment id under which this compartment is created"
  type        = string
}

variable"compartment_name"{
  #default = "asset_mgmt_solutions"
}

data "oci_identity_availability_domains" "ads" {
  compartment_id = "${var.compartment_ocid}"
 # ad_number = "${var.availability_domain}"
}
variable "availability_domain"{
default = "1"
}

#variables to define vcn
variable "vcn_cidr_block"{
description = "provide the valid IPV4 cidr block for vcn"
default = "10.0.0.0/16"
}
variable "vcn_dns_label" {
  description = "A DNS label for the VCN, used in conjunction with the VNIC's hostname and subnet's DNS label to form a fully qualified domain name (FQDN) for each VNIC within this subnet. "
  default     = "AssetMgmtVcn"
}
variable "display_name_vcn"{
description = "privide a displayname for vcn"
default     = "asset_management_vcn"
}

#variables to define the public subnet
variable "cidr_block_publicsubnet"{
description = "note that the cidr block for the subnet must be smaller and part of the vcn cidr block"
default = "10.0.0.0/24"
}
variable "display_name_publicsubnet"{
description = "privide a displayname for public subnet"
default     = "publicsubnet"
}

#variables to define private subnet
variable "display_name_privatesubnet"{
description = "privide a displayname for private subnet"
  default     = "privatesubnet"
}

variable "cidr_block_privatesubnet"{
description = "note that the cidr block for the subnet must be smaller and part of the vcn cidr block"
default     = "10.0.1.0/24"
}

#variables to create linux instance
variable instance_image_ocid {
  type = map(string)

  default = {
    # Updated to Oracle Linux 7.8 with all patches as of April 2020.

    ap-sydney-1 = "ocid1.image.oc1.ap-sydney-1.aaaaaaaagjxhv6npulrdex7l2enor4p4fxfztmefrnu7327p7coqw6bckixa"
    us-ashburn-1 = "ocid1.image.oc1.iad.aaaaaaaa7czp5peti75uc4cazdfxnk5t7fujnsmmdnflydl7vakfahtxw5sq"
    ap-melbourne-1 = "ocid1.image.oc1.ap-melbourne-1.aaaaaaaaoygpvnphpf3q4m3zgj2wvlvag5gjksc63zmmaelbdlnio3gt5mqa"
    ap-mumbai-1  = "ocid1.image.oc1.ap-mumbai-1.aaaaaaaax7qbgn42wwwv6dfkqyt5reesddvlkkqcgl7smmq5m7qrbpr6nr5a"
  }
}

variable "instance_name"{
description  = "provide the display name for thelinux instance to be deployed"
default = "Asset_management_instance"
}

variable "ssh_authorized_keys" {}

variable "preserve_boot_volume" {
  default = false
}
variable "boot_volume_size_in_gbs" {
  default = "50"
}
variable "shape" {
  default = "VM.Standard.E4.Flex"
}
variable "assign_public_ip" {
  default = true
}
variable "instance_shape_config_memory_in_gbs"{
 default = "16"
}
variable "instance_shape_config_ocpus"{
  default ="1"
}

# ATP database variables
variable "atp_password"{}

variable "database_cpu_core_count"{
  default = "1"
}

variable "database_data_storage_size_in_tbs"{
  default = "1"
}

variable "database_db_name"{
  default = "AssetMgmtATP"
}

variable "database_display_name"{
  default = "AssetMgmtATP"
}

variable "database_license_model"{
  default = "LICENSE_INCLUDED"
}
variable "database_db_version"{
  default = "19c"
}

variable "database_db_workload"{
  default = "OLTP"
}

#variables OIC instance.
variable "integration_instance_display_name"{
default = "asset_mgmt_OIC"
}

variable "integration_instance_integration_instance_type"{
  default = "[STANDARD,ENTERPRISE]"
}

variable "integration_instance_is_byol"{
  default = "false"
}

variable "integration_instance_message_packs"{
  default = "1"
}
