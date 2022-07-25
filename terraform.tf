terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
    backend "s3" {
    bucket = "terraform-s3-backend-test-assessment"
    region = "us-east-2"
    key    = "terraform.tfstate"
  }
}