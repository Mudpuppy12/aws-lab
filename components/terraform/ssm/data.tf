data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

data "aws_route_tables" "rts" {
  vpc_id = var.vpc_id

  filter {
    name   = "tag:Name"
    values = ["*-private"]
  }
}

data "aws_subnets" "ssm" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }

  tags = {
    SSM  = "Y"
  }
}
