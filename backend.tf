terraform {
  backend "s3" {
    bucket = "technicalassessment"
    key    = "us-east-1/test"
    region = "us-east-1"
  }
}
