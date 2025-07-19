# 📦 Project_02_S3 — Static Website Hosting with Terraform

This project provisions a **static website** hosted on **Amazon S3** using **Terraform**.

---

## 🚀 Steps Implemented

1. ✅ **Deploy the S3 Bucket**  
   Bucket with versioning, tags, and random name for uniqueness.

2. ✅ **Upload index.html and error.html**  
   Files uploaded via Terraform using `aws_s3_object`.

3. ✅ **Disable public access block**  
   Configured using `aws_s3_bucket_public_access_block`.

4. ✅ **Add a public-read policy**  
   Using `aws_s3_bucket_policy` to allow anonymous access (`s3:GetObject`).

5. ✅ **Enable static website hosting**  
   Through `aws_s3_bucket_website_configuration`, with index and error documents.

6. ✅ **Output the website URL**  
   Using the correct endpoint from `aws_s3_bucket_website_configuration`.

---

## 🌐 Accessing the Website

After `terraform apply`, the static website URL will be output as:

```bash
Apply complete! Resources: X added.
Outputs:

website_url = http://<bucket-name>.s3-website-<region>.amazonaws.com
