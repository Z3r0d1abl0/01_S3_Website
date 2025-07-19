output "name_of_s3_bucket" {
  description = "The name of the S3 bucket created"
  value       = aws_s3_bucket.S3_bucket.bucket
}

output "website_url" {
  description = "URL du site web statique"
  value       = aws_s3_bucket_website_configuration.S3_bucket_website_configuration.website_endpoint
}
