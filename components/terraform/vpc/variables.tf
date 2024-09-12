# generic variables defined

data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

variable "stage" {
  description = "Stage where it will be deployed"
  type        = string
}

# AWS Region
variable "region" {
  description = "Region in which AWS Resources to be created"
  type        = string
  default     = "us-east-1"
}
# Environment Variable
variable "environment" {
  description = "Environment Variable used as a prefix"
  type        = string
  default     = ""
}
# Business Division
variable "owners" {
  description = "organization this Infrastructure belongs"
  type        = string
  default     = ""
}

# VPC variables defined as below
# VPC Name
variable "name" {
  description = "VPC Name"
  type        = string
  default     = "vpc"
}

# VPC CIDR Block
variable "cidr" {
  description = "VPC CIDR Block"
  type        = string
  default     = "10.0.0.0/16"
}

# VPC Availability Zones
variable "azs" {
  description = "A list of availability zones names or ids in the region"
  type        = list(string)
  default     = ["us-east-1c", "us-east-1d", "us-east-1e"]
}

# VPC Public Subnets
variable "public_subnets" {
  description = "A list of public subnets inside the VPC"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.3.0/24", "10.0.5.0/24"]
}

# VPC Private Subnets
variable "private_subnets" {
  description = "A list of private subnets inside the VPC"
  type        = list(string)
  default     = ["10.0.2.0/24", "10.0.4.0/24", "10.0.6.0/24"]
}

# VPC Database Subnets
variable "database_subnets" {
  description = "A list of database subnets inside the VPC"
  type        = list(string)
  default     = ["10.0.151.0/24", "10.0.152.0/24"]
}

# VPC Create Database Subnet Group (True / False)
variable "create_database_subnet_group" {
  description = "VPC Create Database Subnet Group, Controls if database subnet group should be created"
  type        = bool
  default     = true
}

# VPC Create Database Subnet Route Table (True or False)
variable "create_database_subnet_route_table" {
  description = "VPC Create Database Subnet Route Table, Controls if separate route table for database should be created"
  type        = bool
  default     = true
}


# VPC Enable NAT Gateway (True or False) 
variable "enable_nat_gateway" {
  description = "Should be true if you want to provision NAT Gateways for each of your private networks"
  type        = bool
  default     = true
}

# VPC Single NAT Gateway (True or False)
variable "single_nat_gateway" {
  description = "Should be true if you want to provision a single shared NAT Gateway across all of your private networks"
  type        = bool
  default     = false
}

variable "one_nat_gateway_per_az" {
  description = "The module will place one NAT gateway in each availability zone you specify in var.azs"
  type        = bool
  default     = true

}

