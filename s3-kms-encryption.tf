resource "aws_kms_key" "s3_kms_key" {
  description             = "KMS key for S3 bucket encryption"
  deletion_window_in_days = 30
  enable_key_rotation     = true
}

resource "aws_s3_bucket" "secure_bucket" {
  bucket = "sensitive-data-bucket-${random_id.suffix.hex}"
  acl    = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.s3_kms_key.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }
}

resource "random_id" "suffix" {
  byte_length = 4
}
