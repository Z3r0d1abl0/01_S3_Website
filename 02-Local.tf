locals {
  prefix = "s3"
}
locals {
  common_tags = {
    Project = "Project_02_S3"
    Owner   = "Erwan"
    Environment = "Dev"
  }

  s3_bucket_tags = merge(
    local.common_tags, {
      Name = "s3_bucket"
    }
  )
}
