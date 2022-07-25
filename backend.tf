
# ------------------------------------------------------------------------------
# CREATE THE S3 BUCKET
# ------------------------------------------------------------------------------
resource "random_pet" "server" {
  keepers = {
    # Generate a new pet name each time we switch to a new s3 bucket
    aws_s3_bucket = var.aws_s3_bucket
  }
}

resource "aws_instance" "server" {
  tags = {
    Name = "web-server-${random_pet.server.id}"
  }
resource "aws_s3_bucket" "terraform_state" {
    acl    = "private"
  # Enable versioning so we can see the full revision history of our
  # state files
  versioning {
    enabled = true
  }
    tags = {
    Name = "web-server-${random_pet.server.id}"
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
