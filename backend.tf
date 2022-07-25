

 resource "aws_s3_bucket" "backend" {
  bucket = "terraform-s3-backend-test-assessment"
  acl    = "private"
}

resource "aws_s3_bucket" "main" {
  bucket_prefix = "my-project-"
  acl           = "private"
}



 terraform {
   backend "s3" {
     bucket = "terraform-s3-backend-test-assessment"
     key    = "us-east-2/test"
     region = "us-east-2"
   }
 }