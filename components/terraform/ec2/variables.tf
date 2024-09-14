variable "stage" {
  description = "Stage where it will be deployed"
  type        = string
  default     = ""
}

variable "environment" {
  description = "Stage where it will be deployed"
  type        = string
  default     = ""
}

variable "ami" {
  description = "ami to use"
  type        = string
  default     = ""
}

variable "key_name" {
  description = "ami to use"
  type        = string
  default     = ""
}

variable "ssm_role_name" {
  description = "Name of SSM Role"
  type        = string
  default     = ""
}

variable "vpc_id" {
  type    = string
  default = ""
}

variable "cidr" {
  description = "VPC CIDR Block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "private_subnets" {
  type    = string
  default = ""

}