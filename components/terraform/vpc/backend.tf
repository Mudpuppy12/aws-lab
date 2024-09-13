terraform {

  backend "s3" {
    bucket               = "terraform-tfstate-zz12"
    key                  = "terraform.tfstate"
    region               = "us-east-1"
    encrypt              = true
    dynamodb_table       = "terraform_tf_lockid"
    workspace_key_prefix = "vpc"
  }
}
