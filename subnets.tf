# resource "aws_subnet" "public-subnet" {
#     count = "${length(var.pub-cidrs)}"
#     vpc_id = "${aws_vpc.default.id}"
#     map_public_ip_on_launch = true
#     cidr_block = "${element(var.pub-cidrs, count.index)}"
#     availability_zone = "${element(var.azs, count.index)}"
#     tags = {
#         Name = "PUB-SN-${count.index+1}-${aws_vpc.default.tags.Name}"
#     }
# }

# resource "aws_subnet" "private-subnet" {
#     count = "${length(var.pri-cidrs)}"
#     vpc_id = "${aws_vpc.default.id}"
#     cidr_block = "${element(var.pri-cidrs, count.index)}"
#     availability_zone = "${element(var.azs, count.index)}"
#     tags = {
#         Name = "PRI-SN-${count.index+1}-${aws_vpc.default.tags.Name}"
#     }
# }