variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "compartment_ocid" {}

variable "parent_compartment" {
  description = "parent compartment id under which this compartment is created"
  type        = string

}
