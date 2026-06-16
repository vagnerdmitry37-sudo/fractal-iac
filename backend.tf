terraform {
  backend "s3" {
    bucket         = "fractal-terraform-state"
    key            = "terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "fractal-terraform-state-locks"
  }
}