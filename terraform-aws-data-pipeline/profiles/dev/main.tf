terraform {
  backend "s3" {
    bucket  = "data-ninja-and-dude-terraform"
    region  = "us-west-2"
    key     = "dev/terraform.tfstate"
    encrypt = true
  }
}

module "aws" {
  source              = "../../modules/aws"
  environment         = var.environment
  ecr_repository_name = "s3-2-lambda"
  bucket_name         = "s3-2-lambda"
  role_name           = "s3-2-lambda"
  lambda_name         = "s3-2-lambda"
  lambda_image_tag    = "latest"
}
