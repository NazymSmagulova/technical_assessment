terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
    backend "s3" {
    bucket = "terraform-s3-backend-pmh86b2v"
    region = "ap-northeast-1"
    key    = "terraform.tfstate"
  }
}