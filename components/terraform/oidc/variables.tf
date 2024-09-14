variable "repos" {
  type        = list(string)
  description = "Repos to give access"
  default     = []

}

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