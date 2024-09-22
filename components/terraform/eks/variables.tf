variable "region" {
    default = "us-east-1"
    type        = string
}

variable "cluster_name" {
    type        = string
}

variable "stage" {
  description = "Stage where it will be deployed"
  type        = string
  default     = ""
}

variable "environment" {
  description = "Environment where it will be deployed"
  type        = string
  default     = ""
}

variable "private_subnets" {
  type    = string
  description = "Private VPC Subnets"
  default = ""

}

variable "public_subnets" {
  description = "Public VPC Subnets"
  type    = string
  default = ""

}

variable "intra_subnets" {
  description = "Intra/Control subnets"
  type    = string
  default = ""

}

variable "vpc_id" {
  description = "VPC ID"
  type    = string
  default = ""
}