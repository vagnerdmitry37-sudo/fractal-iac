variable "bucket_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "enable_versioning" {
  type    = bool
  default = false
}

variable "kms_key_id" {
  type = string
}

variable "force_destroy" {
  type    = bool
  default = false
}

variable "project_name" {
  type = string
}

variable "region" {
  type = string
}
