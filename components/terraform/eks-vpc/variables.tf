# VPC CIDR Block

variable "cidr" {
  description = "VPC CIDR Block"
  type        = string
  default     = ""
}

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
  default     = ""
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

