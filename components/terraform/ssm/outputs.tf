output "ssm_role_name" {
  value       =  aws_iam_role.ssm_role.name
  description = "The SSM Role Name"
}
