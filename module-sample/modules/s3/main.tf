resource "aws_s3_bucket" "my-bucket" {
  bucket = var.bucket

  tags = {
    Name        = "My bucket"
    Environment = var.env
  }
}
