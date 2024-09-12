module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.13.0"

  # Details

  name            = "${var.name}-${local.name}"
  cidr            = var.cidr
  azs             = var.azs
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets

  database_subnets                   = var.database_subnets
  create_database_subnet_group       = var.create_database_subnet_group
  create_database_subnet_route_table = var.create_database_subnet_route_table

  create_database_internet_gateway_route = false
  create_database_nat_gateway_route = false

  # NAT Gateways - Outbound Communication
  enable_nat_gateway     = var.enable_nat_gateway
  single_nat_gateway     = var.single_nat_gateway
  one_nat_gateway_per_az = var.one_nat_gateway_per_az

  # DNS Parameters in VPC
  enable_dns_hostnames = true
  enable_dns_support   = true

  # Additional tags for the VPC

  tags     = local.tags
  vpc_tags = local.tags

  # Additional tags
  # Additional tags for the public subnets
  public_subnet_tags = {
    Name = "VPC Lab Public Subnets"
  }
  # Additional tags for the private subnets
  private_subnet_tags = {
    Name = "VPC Lab Private Subnets",
    SSM = "Y"
  }
  # Additional tags for the database subnets
  database_subnet_tags = {
    Name = "VPC Private Database Subnets"
  }
  # Instances launched into the Public subnet should be assigned a public IP address. Specify true to indicate that instances launched into the subnet should be assigned a public IP address
  map_public_ip_on_launch = true
}