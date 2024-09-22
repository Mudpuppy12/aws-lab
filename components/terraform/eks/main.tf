
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = local.name
  cluster_version = local.cluster_version

  vpc_id                   = var.vpc_id
  subnet_ids               = local.public_subnets
  control_plane_subnet_ids = local.intra_subnets

  enable_cluster_creator_admin_permissions = true

  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true

  enable_irsa               = true
  create_kms_key            = false
  enable_kms_key_rotation   = false
  cluster_encryption_config = {}
  
  # EKS Addons
  cluster_addons = {
    coredns                = {}
    eks-pod-identity-agent = {}
    kube-proxy             = {}
    vpc-cni                = {}
  }
  
  
  eks_managed_node_group_defaults = {
    ami_type       = "AL2023_x86_64_STANDARD"
    instance_types = ["m5.large"]

    iam_role_attach_cni_policy = true
  }

  eks_managed_node_groups = {
    default_node_group = {
      use_custom_launch_template = false
      disk_size                  = 50
      desired_size               = 2
    }
  }

# Allow to Root admin access to view cluster configs

access_entries = {
    cluster_admin = {
      kubernetes_groups = []
      principal_arn     = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
      
      policy_associations = {
        cluster_admin = {
          policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
          access_scope = {
            type = "cluster"
          }
        }
      }
    } 
  }
  tags = local.tags
}






