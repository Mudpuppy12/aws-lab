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

variable "secret_token_arn" {
  description = "ARN of secret github token"
  type        = string
  default     = ""
}

