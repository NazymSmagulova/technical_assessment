terraform {
 backend "s3" {
   bucket         = "tech-assessment_ns1111"
   key            = "state/terraform.tfstate"
   region         = "us-east-2"
   encrypt        = true
   kms_key_id     = "alias/terraform-bucket-key"
   dynamodb_table = "terraform-state"
   depends_on = [aws_s3_bucket.terraform-state]
 }
}