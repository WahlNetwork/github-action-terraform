## =============================================================================
#  Configure the AWS Provider                                                  #
## =============================================================================
terraform {
  required_providers {
    aws = "~> 2.59"
  }
}

provider "aws" {
  region = var.aws_region
}
