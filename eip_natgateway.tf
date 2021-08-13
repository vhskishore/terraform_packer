# resource "aws_eip" "lb" {
#   vpc      = true
# }

# resource "aws_nat_gateway" "ngw" {
#   allocation_id = "${aws_eip.lb.id}"
#   subnet_id     = "${aws_subnet.public-subnet.0.id}"
#   tags = {
#     Name = "NGW-${aws_vpc.default.tags.Name}"
#   }
# }