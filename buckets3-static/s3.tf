resource "aws_s3_bucket" "bucket_s3_static" {
  bucket = "bucket-s3-static"

  versioning {
    enabled = true
  }

  tags = {
    Name  = "bucket-s3-static"
    Owner = "ms.joao.felipe@gmail.com"
  }
}