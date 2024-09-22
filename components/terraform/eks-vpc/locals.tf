locals {
  name   = var.cluster_name
  region = data.aws_region.current.name

  vpc_cidr = var.cidr

  azs = slice(data.aws_availability_zones.available.names, 0, 2)

  tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }
}