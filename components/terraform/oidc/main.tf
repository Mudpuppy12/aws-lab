module "github-oidc" {
  source  = "terraform-module/github-oidc-provider/aws"
  version = "~> 1"

  create_oidc_provider = true
  create_oidc_role     = true

  repositories              = var.repos
  oidc_role_attach_policies = [aws_iam_policy.deploy.arn]
}


### Roles

## Deploy Policy Example

data "aws_iam_policy_document" "deploy" {
  statement {
    effect = "Allow"
    actions = [
      "s3:*", "dynamodb:*", "ec2:*", "ssm:*", "kms:*", "rds:*", "iam:*", "logs:*", "secretsmanager:*",
      "eleasticache:*", "elasticloadbalancing:*", "codebuild:*"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "deploy" {
  name        = "ci-deploy-policy"
  description = "Policy used for deployments on CI"
  policy      = data.aws_iam_policy_document.deploy.json
}
