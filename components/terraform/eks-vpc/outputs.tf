output "azs" {
  description = "Availability Zones"
  value       = module.vpc.azs
}

output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}
output "cidr" {
  description = "VPC Cidr"
  value       = var.cidr
}

output "private_subnets" {
  description = "Private subnet ids"
  value       = module.vpc.private_subnets
}

output "public_subnets" {
  description = "Public subnet ids"
  value       = module.vpc.public_subnets
}

output "intra_subnets" {
  description = "Intra subnet ids"
  value       = module.vpc.intra_subnets
}

output "cluster_name" {
  description = "Cluster name"
  value       = var.cluster_name

}

