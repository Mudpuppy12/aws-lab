
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
    type = list(string)
    default = []
    
}