resource "aws_lambda_function" "s3_2_lambda_lambda_function" {
  function_name = "${var.lambda_name}-lambda-function-${var.environment}"

  package_type = "Image"
  image_uri    = "${var.ecr_repository_url}:${var.lambda_image_tag}"

  role = var.iam_role_arn

  timeout     = 900
  memory_size = 2048

  architectures = ["arm64"]
}

resource "aws_s3_bucket_notification" "s3_2_lambda_bucket_notification" {
  bucket = var.s3_bucket_id

  lambda_function {
    lambda_function_arn = aws_lambda_function.s3_2_lambda_lambda_function.arn
    events              = ["s3:ObjectCreated:*"]
    filter_prefix       = ""
    filter_suffix       = ".csv"
  }

  depends_on = [aws_lambda_function.s3_2_lambda_lambda_function]
}

resource "aws_lambda_permission" "allow_s3_2_lambda_bucket_notification" {
  statement_id  = "AllowExecutionFromS3Bucket"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.s3_2_lambda_lambda_function.arn
  principal     = "s3.amazonaws.com"
  source_arn    = var.s3_bucket_arn
}
