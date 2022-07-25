 terraform {
    backend "s3" {
      bucket = "terraform-s3-backend-test-assessment"
      key    = "us-east-2/test"
      region = "us-east-2"
    }
  }
