
resource "aws_s3_bucket" "terraform_state" {

  bucket = "technical-assessment-nazym-55"

  # Enable versioning so we can see the full revision history of our
  # state files
  versioning {
    enabled = true
  }
  
resource "aws_s3_bucket_acl" "example_bucket_acl" {
  bucket = aws_s3_bucket.terraform_state.id
  acl    = "private"
}

  # Enable server-side encryption by default
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

# ------------------------------------------------------------------------------
# CREATE THE DYNAMODB TABLE
# ------------------------------------------------------------------------------

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-up-and-running-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
