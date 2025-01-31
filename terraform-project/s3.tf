resource "aws_s3_bucket" "model_bucket" {
  bucket = "deepseek-model-bucket-12345"  # Replace with a unique name
  acl    = "private"

  tags = {
    Name        = "DeepSeekModelBucket"
    Environment = "Dev"
  }
}


resource "aws_s3_bucket_server_side_encryption_configuration" "model_bucket_encryption" {
  bucket = aws_s3_bucket.model_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
