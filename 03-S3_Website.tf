resource "random_pet" "s3_bucket_name" {
  prefix = "${local.prefix}-s3-bucket"
    length = 2  
}
resource "aws_s3_bucket" "S3_bucket" {
  bucket = "R3_bucket-${random_pet.s3_bucket_name.id}"

 tags = merge(
    local.common_tags,
    {
      Name = "my_bucket"
    }
    )
force_destroy = true
}
resource "aws_s3_bucket_public_access_block" "S3_bucket_public_access_block" {
  bucket = aws_s3_bucket.S3_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
resource "aws_s3_bucket_versioning" "S3_bucket_versioning" {
  bucket = aws_s3_bucket.S3_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}
resource "aws_s3_bucket_policy" "S3_bucket_policy" {
  bucket = aws_s3_bucket.S3_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = "*"
        Action = "s3:GetObject"
        Resource = "${aws_s3_bucket.S3_bucket.arn}/*"
      }
    ]
  })
  
}


resource "aws_s3_bucket_website_configuration" "S3_bucket_website_configuration" {
  bucket = aws_s3_bucket.S3_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}
