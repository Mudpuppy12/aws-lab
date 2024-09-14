# Default EC2 Security group for EC2 Hosts

resource "aws_security_group" "ec2_server_sg_tf" {
  name        = "ec2-server-sg-tf"
  description = "Allow SSH to server"
  vpc_id      = var.vpc_id

  ingress {
    description = "VPC IP Ingress"
    from_port   = 0
    to_port     = 0
    protocol    = "all"
    cidr_blocks = [var.cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "EC2 Default Host Security Group"
  }
}