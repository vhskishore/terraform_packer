# resource "aws_instance" "public-instance" {
#     for_each = toset(data.aws_availability_zones.azs.names)
#     ami = var.imagename
#     instance_type = "t2.micro"
#     key_name = "${var.key_name}"
#     subnet_id = "${element(aws_subnet.public-subnet.*.id, index(data.aws_availability_zones.azs.names,each.value))}"
#     vpc_security_group_ids = [ "${aws_security_group.allow_all.id}" ]
#     associate_public_ip_address = true
#     tags = {
#         Name = "Public-Server-${each.value}"
#     }
# }

# resource "aws_instance" "pub-instance" {
#     count=1
#     ami = var.imagename
#     instance_type = "t2.micro"
#     key_name = "${var.key_name}"
#     subnet_id = "${element(aws_subnet.public-subnet.*.id, count.index)}"
#     vpc_security_group_ids = [ "${aws_security_group.allow_all.id}" ]
#     associate_public_ip_address = true
#     tags = {
#         Name = "Public-Server-${count.index}"
#     }
# }