output "ecr_repository_url" {
  value = aws_ecr_repository.s3_2_lambda_ecr_repository.repository_url
}

output "ecr_repository_arn" {
  value = aws_ecr_repository.s3_2_lambda_ecr_repository.arn
}

output "ecr_repository_registry_id" {
  value = aws_ecr_repository.s3_2_lambda_ecr_repository.registry_id
}
