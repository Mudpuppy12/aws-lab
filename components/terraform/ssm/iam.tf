#### Create the IAM role for the instance profile ####

resource "aws_iam_role" "ssm_role" {

  name = var.ssm_role

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "EC2AssumeRole"
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

#### Create Policy to allow instance profile to put objects in the S3 bucket ####

resource "aws_iam_policy" "ec2_policy" {
  name        = "ssm_logs_policy_${data.aws_region.current.name}_${data.aws_caller_identity.current.account_id}"
  description = "Policy allowing put and get operations for ec2 to place session logs in specified bucket"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:PutObjectAcl",
          "s3:GetEncryptionConfiguration"

        ]
        Effect   = "Allow"
        Resource = "${aws_s3_bucket.log_bucket.arn}*"
      },
    ]
  })
}

#### Create policy to allow instance role to use the CloudWatch key and SSM preference key to encrypt/decrypt data ####

data "aws_iam_policy_document" "kms_policy" {
  statement {
    effect = "Allow"
    actions = [
      "kms:decrypt",
      "kms:encrypt"
    ]
    resources = [
      aws_kms_key.ssm_access_key.arn
    ]
  }
}

resource "aws_iam_policy" "kms_policy" {
  policy = data.aws_iam_policy_document.kms_policy.json
  name   = "kms-ssm-allow"
}

#### Attach AWS and Customer managed policies to the IAM role ####

resource "aws_iam_role_policy_attachment" "ssm-attach" {
  role       = aws_iam_role.ssm_role.name
  policy_arn = var.ssm_policy_arn
}

resource "aws_iam_role_policy_attachment" "cloudwatch-attach" {
  role       = aws_iam_role.ssm_role.name
  policy_arn = var.cloudwatch_policy_arn
}

resource "aws_iam_role_policy_attachment" "kms-attach" {
  role       = aws_iam_role.ssm_role.name
  policy_arn = aws_iam_policy.kms_policy.arn
}

resource "aws_iam_role_policy_attachment" "s3_attach" {
  role       = aws_iam_role.ssm_role.name
  policy_arn = aws_iam_policy.ec2_policy.arn

}
