resource "aws_s3_bucket" "My_Demo_Bucket" {
  bucket = "minhaj-day15-bucket-2026"
}

resource "aws_s3_bucket_versioning" "versioning"{
    bucket = aws_s3_bucket.My_Demo_Bucket.id

    versioning_configuration{
        status = "Enabled"
    }
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.My_Demo_Bucket.id

  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_object" "index" {
  bucket       = aws_s3_bucket.My_Demo_Bucket.id
  key          = "index.html"
  source       = "index.html"
  content_type = "text/html"
}

output "website_endpoint" {
  value = aws_s3_bucket_website_configuration.website.website_endpoint
}