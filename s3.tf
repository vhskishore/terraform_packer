# resource "aws_s3_bucket" "packer" {
#     bucket = "hskpackertest"

#     tags = {
#       Name = "hskpackertest"
#       Environment = "QA"
#     }

# }

# resource "aws_s3_bucket" "awsitzhskxyz" {
#   bucket = "awsitzhsk.xyz0001"

#   tags = {
#     Name        = "hskpackertest"
#     Environment = "QA"
#   }
#   lifecycle {
#     create_before_destroy = true
#   }

# }