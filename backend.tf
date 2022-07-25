resource "aws_s3_bucket" "backend" {
  bucket = "terraform-s3-backend-test-assessment"
  acl    = "private"
}

resource "aws_s3_bucket" "main" {
  bucket_prefix = "my-project-"
  acl           = "private"
}


    backend "s3" {
    bucket = "terraform-s3-backend-test-assessment"
    region = "us-east-1"
    key    = "terraform.tfstate"
  }
}