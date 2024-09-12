resource "aws_security_group" "http_allow" {
  name        = "SSM"
  description = "Security group to allow traffic over HTTPS 443"
  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "allow outbound traffic over 443"
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.cidr]
    description = "allow outbound traffic over 443"
  }

  tags = {
    Name = "SSM Default HTTP_ALLOW Security Group"
  }
  vpc_id =var.vpc_id

}