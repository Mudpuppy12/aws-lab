terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.9.0"
    }

    utils = {
      source = "cloudposse/utils"
      version = ">= 1.17.0"
    }
  }
}
