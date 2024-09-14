resource "aws_instance" "hosts" {
  count                  = length(local.private_subnets)
  ami                    = var.ami
  instance_type          = "t2.micro"
  subnet_id              = element(local.private_subnets, count.index)
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.ec2_server_sg_tf.id]
  iam_instance_profile   = aws_iam_instance_profile.ssm_profile.name
  monitoring             = true

  source_dest_check = true

  metadata_options {
    http_tokens                 = "required"
    http_endpoint               = "enabled"
    http_put_response_hop_limit = 1
    instance_metadata_tags      = "disabled"
  }

  tags = {
    Name = " ${var.environment} Host ${count.index + 1}"
  }
}

resource "aws_iam_instance_profile" "ssm_profile" {
  name = "ssm-ec2-profile"
  role = var.ssm_role_name

}