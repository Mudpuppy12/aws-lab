
variable "vpc_id" {
  type    = string
  default  = ""
  }

variable "stage" {
  description = "Stage where it will be deployed"
  type        = string
  default     = ""
}

variable "private_subnets" {
    type = string
    default = ""

}

locals {
  private_subnets= jsondecode(var.private_subnets)

}

output nice {
    value = local.private_subnets
}
