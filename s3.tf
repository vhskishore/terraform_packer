# resource "aws_s3_bucket" "packer" {
#     bucket = "hskpackertest"

#     tags = {
#       Name = "hskpackertest"
#       Environment = "QA"
#       Env = var.env
#     }

# }

# resource "aws_s3_bucket" "awsitzhskxyz" {
#   bucket = "awsitzhsk.xyz0001"

#   tags = {
#     Name        = "hskpackertest"
#     Environment = "QA"
#      Env = var.env
#   }
#   lifecycle {
#     create_before_destroy = true
#   }

# }