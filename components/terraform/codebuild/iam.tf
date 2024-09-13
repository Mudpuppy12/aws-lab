data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["codebuild.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

data "aws_iam_policy_document" "codebuild" {

  statement {
    effect = "Allow"

    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]

    resources = ["*"]
  }

  statement {
    effect = "Allow"
    actions = ["s3:PutObject",
      "s3:GetObject",
      "s3:GetObjectVersion",
      "s3:GetBucketAcl",
      "s3:GetBucketLocation"
    ]
    resources = ["arn:aws:s3:::codepipeline-${data.aws_region.current.name}-*"]
  }

  statement {
    effect = "Allow"
    actions = ["codebuild:CreateReportGroup",
      "codebuild:CreateReport",
      "codebuild:UpdateReport",
      "codebuild:BatchPutTestCases",
      "codebuild:BatchPutCodeCoverages"
    ]
    resources = ["arn:aws:codebuild:${data.aws_region.current.name}::*"]
  }

  statement {
    effect = "Allow"

    sid     = "SidGetSecretValue"
    actions = ["secretsmanager:GetSecretValue"]


    resources = [
      "${var.secret_token_arn}"
    ]
  }

}

resource "aws_iam_role_policy" "codebuild" {
  name   = "CodeBuild-GitHub-Runner"
  role   = aws_iam_role.codebuild.name
  policy = data.aws_iam_policy_document.codebuild.json
}

resource "aws_iam_role" "codebuild" {
  name               = "codebuild-gitrunner-service-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}
