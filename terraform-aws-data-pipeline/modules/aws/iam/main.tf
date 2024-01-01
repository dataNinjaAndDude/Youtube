resource "aws_iam_role" "s3_2_lambda_lambda_role" {
  name = "${var.role_name}-lambda-role-${var.environment}"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy" "s3_2_lambda_lambda_role_s3_policy" {
  name   = "${var.role_name}-lambda-role-s3-policy-${var.environment}"
  role   = aws_iam_role.s3_2_lambda_lambda_role.id
  policy = data.aws_iam_policy_document.s3_2_lambda_lambda_role_s3_policy_document.json
}

data "aws_iam_policy_document" "s3_2_lambda_lambda_role_s3_policy_document" {
  statement {
    actions = [
      "s3:GetObject",
      "s3:GetBucketLocation",
      "s3:GetObjectVersion",
      "s3:ListBucket",
    ]
    effect = "Allow"
    resources = [
      "${var.s3_bucket_arn}/*"
    ]
  }
}

resource "aws_iam_role_policy" "s3_2_lambda_lambda_role_ecr_policy" {
  name   = "${var.role_name}-lambda-role-ecr-policy-${var.environment}"
  role   = aws_iam_role.s3_2_lambda_lambda_role.id
  policy = data.aws_iam_policy_document.s3_2_lambda_lambda_role_ecr_policy_document.json
}

data "aws_iam_policy_document" "s3_2_lambda_lambda_role_ecr_policy_document" {
  statement {
    actions = [
      "ecr:GetAuthorizationToken",
      "ecr:BatchCheckLayerAvailability",
      "ecr:GetDownloadUrlForLayer",
      "ecr:GetRepositoryPolicy",
      "ecr:DescribeRepositories",
      "ecr:ListImages",
      "ecr:DescribeImages",
      "ecr:BatchGetImage",
    ]
    effect = "Allow"
    resources = [
      "*"
    ]
  }
}

resource "aws_iam_role_policy" "s3_2_lambda_lambda_role_logging_policy" {
  name   = "${var.role_name}-lambda-role-logging-policy-${var.environment}"
  role   = aws_iam_role.s3_2_lambda_lambda_role.id
  policy = data.aws_iam_policy_document.s3_2_lambda_lambda_role_logging_policy_document.json
}

data "aws_iam_policy_document" "s3_2_lambda_lambda_role_logging_policy_document" {
  statement {
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]
    effect = "Allow"
    resources = [
      "arn:aws:logs:*:*:*"
    ]
  }
}
