resource "aws_s3_bucket" "s3_2_lambda" {
  bucket = "${var.bucket_name}-s3-${var.environment}"
}

resource "aws_s3_bucket_ownership_controls" "s3_2_lambda_bucket_ownership_controls" {
  bucket = aws_s3_bucket.s3_2_lambda.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "s3_2_lambda_bucket_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.s3_2_lambda_bucket_ownership_controls]

  bucket = aws_s3_bucket.s3_2_lambda.id
  acl    = "private"
}
