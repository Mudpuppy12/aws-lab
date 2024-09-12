variable "s3_bucket" {
  type        = string
  description = "Name of the S3 bucket for S3 server side logging of session manager sessions"
  default     = ""
}

variable "s3_log_bucket_id" {
  type        = string
  description = "Name of the S3 logging bucket to deliver S3 server logs to. BUCKET MUST BE EXISTING!"
  default     = ""
}

variable "ssm_role" {
  type        = string
  description = "The name of the role to be assigned to the instance profile:"
  default     = ""
}

variable "cloudwatch_policy_arn" {
  type    = string
  default = "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess"

}

variable "ssm_policy_arn" {
  type    = string
  default = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

variable "team" {
  type        = string
  description = "Name of your team to be appended to the SSM Instance Profile:"
  default     = ""
}


variable "vpc_id" {
  type    = string
  default  = ""
  }

variable "cidr" {
  description = "VPC CIDR Block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "stage" {
  description = "Stage where it will be deployed"
  type        = string
  default     = ""
}
