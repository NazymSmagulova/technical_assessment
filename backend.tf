

 provider "aws" {
  region = var.region
}
resource "aws_s3_bucket" "backend" {
  bucket = "terraform-s3-backend-test-assessment"
  acl    = "private"
}

resource "aws_s3_bucket" "main" {
  bucket_prefix = "my-project-"
  acl           = "private"
}


