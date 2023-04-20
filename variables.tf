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
data "oci_identity_availability_domain" "ad" {
  compartment_id = "${var.compartment_ocid}"
  ad_number = "${var.availability_domain}"
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
  default     = "asset_management_vcn"
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
  type = "map"

  default = {
    # Updated to Oracle Linux 7.8 with all patches as of April 2020.

    ap-sydney-1 = "ocid1.image.oc1.ap-sydney-1.aaaaaaaao3vineoljixw657cxmbemwasdgirfy6yfgaljqsvy2dq7wzj2l4q"
    us-ashburn-1 = "ocid1.image.oc1.iad.aaaaaaaahjkmmew2pjrcpylaf6zdddtom6xjnazwptervti35keqd4fdylca"
    us-phoenix-1 = "ocid1.image.oc1.phx.aaaaaaaav3isrmykdh6r3dwicrdgpmfdv3fb3jydgh4zqpgm6yr5x3somuza"
    ap-mumbai-1  = "ocid1.image.oc1.ap-mumbai-1.aaaaaaaanwfcq3baulkm73kcimzymx7qgfpoja2b56wgwhopjjgrz4om67zq"
  }
}

variable "instance_name"{
description  = "provide the display name for thelinux instance to be deployed"
}

variable "ssh_authorized_keys" {
  default = "C:/Users/megn/new.pub"
}

variable "preserve_boot_volume" {
  default = false
}
variable "boot_volume_size_in_gbs" {
  default = "50"
}
variable "shape" {
  default = "VM.Standard2.1"
}
variable "assign_public_ip" {
  default = true
}
