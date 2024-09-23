output "ssm_role_name" {
  value       = aws_iam_role.ssm_role.name
  description = "The SSM Role Name"
}


output "log_arn" {
  description = "The ARN for the policy to write logs to SSM bucket"
  value = aws_iam_policy.ec2_policy.arn
}

output "kms_arn" {
  description = "The ARN for the policy to access the kms key for SSM"
  value = aws_iam_policy.kms_policy.arn

}