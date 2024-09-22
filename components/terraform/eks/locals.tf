locals {
  region = data.aws_region.current.name
  name   = var.cluster_name
  # More comples variable passing requires decode

  private_subnets = jsondecode(var.private_subnets)
  public_subnets  = jsondecode(var.public_subnets)
  intra_subnets   = jsondecode(var.intra_subnets)

  cluster_version = "1.30"
  tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }
}  