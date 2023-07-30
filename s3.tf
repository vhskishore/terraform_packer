resource "aws_s3_bucket" "packer" {
    bucket = "hskpackertest"

    tags = {
      Name = "hskpackertest"
      Environment = "QA"
    }
  
}