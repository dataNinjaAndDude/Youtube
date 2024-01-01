output "s3_bucket_arn" {
  value = aws_s3_bucket.s3_2_lambda.arn
}

output "s3_bucket_id" {
  value = aws_s3_bucket.s3_2_lambda.id
}
