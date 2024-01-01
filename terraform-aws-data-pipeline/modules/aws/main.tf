module "ecr" {
  source              = "./ecr"
  environment         = var.environment
  ecr_repository_name = var.ecr_repository_name
}

module "s3" {
  source      = "./s3"
  environment = var.environment
  bucket_name = var.bucket_name
}

module "iam" {
  source        = "./iam"
  environment   = var.environment
  role_name     = var.role_name
  s3_bucket_arn = module.s3.s3_bucket_arn
}

module "lambda" {
  source             = "./lambda"
  environment        = var.environment
  lambda_name        = var.lambda_name
  lambda_image_tag   = var.lambda_image_tag
  ecr_repository_url = module.ecr.ecr_repository_url
  iam_role_arn       = module.iam.role_arn
  s3_bucket_id       = module.s3.s3_bucket_id
  s3_bucket_arn      = module.s3.s3_bucket_arn
}
