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

variable "publicSubnet_dns_label" {
description = "A DNS label prefix for the subnet, used in conjunction with the VNIC's hostname and VCN's DNS label to form a fully qualified domain name (FQDN) for each VNIC within this subnet. "
  default     = "publicsubnet"
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

variable "privateSubnet_dns_label" {
  description = "A DNS label prefix for the subnet, used in conjunction with the VNIC's hostname and VCN's DNS label to form a fully qualified domain name (FQDN) for each VNIC within this subnet. "
  default     = "privatesubnet"
}
