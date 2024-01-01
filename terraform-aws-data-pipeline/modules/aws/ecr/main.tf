resource "aws_ecr_repository" "s3_2_lambda_ecr_repository" {
  name                 = "${var.ecr_repository_name}-ecr-${var.environment}"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
}
