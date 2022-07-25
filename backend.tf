terraform {
  backend "s3" {
    bucket         = "terraform-tech-assessment-s3"
    key            = "terraform.tfstate"
    region         = "us-east-2"
  }
}
resource "aws_s3_bucket" "backend_s3_bucket" {
  bucket = "terraform-state-repository"
  acl    = "private"
  versioning {
    enabled = true
  }
}