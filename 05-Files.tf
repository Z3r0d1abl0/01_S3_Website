resource "aws_s3_object" "index_html" {
  bucket = aws_s3_bucket.S3_bucket.id
  key    = "index.html"
  source = "${path.module}/index.html"
  etag   = filemd5("${path.module}/index.html")
    content_type = "text/html"
}
resource "aws_s3_object" "error_html" {
  bucket = aws_s3_bucket.S3_bucket.id
  key    = "error.html"
  source = "${path.module}/error.html"
  etag   = filemd5("${path.module}/error.html")
    content_type = "text/html"
}
