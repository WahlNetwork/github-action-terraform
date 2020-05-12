## =============================================================================
#  Variables - Authentication                                                  #
## =============================================================================
variable "aws_region" {
  type        = string
  description = "Default region for root module"
}

## =============================================================================
#  Variables - Naming                                                          #
## =============================================================================
variable "aws_root_name" {
  type        = string
  description = "Root name prefix to use in resource name tags"
}

variable "aws_region_name" {
  type        = string
  description = "Region name suffix to use in resource name tags"
}

variable "aws_environment_name" {
  type        = string
  description = "Environment name to use in resource name tags"
}

variable "aws_source_name" {
  type        = string
  description = "Source name of the tool that constructed the resource to use in resource name tags"
}

## =============================================================================
#  Variables - Users                                                           #
## =============================================================================
variable "aws_kms_admin" {
  type        = string
  description = "Key Administrator"
}

variable "aws_kms_user" {
  type        = string
  description = "Key User"
}
