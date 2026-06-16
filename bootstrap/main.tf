resource "aws_kms_key" "fractal_terraform_state_kms_key" {
  description = "KMS key for Terraform state encryption"
}

module "s3-buckets" {
  source = "../modules/s3_bucket"

  bucket_name       = "fractal-terraform-state"
  project_name      = "fractal-iac"
  kms_key_id        = aws_kms_key.fractal_terraform_state_kms_key.arn
  environment       = "dev"
  enable_versioning = true
  region            = "eu-central-1"
}

module "dynamodb_table" {
  source = "../modules/dynamodb_table"

  table_name         = "fractal-terraform-state-locks"
  partition_key_name = "LockeID"
  region             = "eu-central-1"
}
