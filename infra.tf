resource "aws_vpc" "default" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    #Name  = timestamp()
    Name = var.vpcName
  }
}

resource "aws_subnet" "public-subnet" {
  vpc_id                  = aws_vpc.default.id
  map_public_ip_on_launch = true
  cidr_block              = var.public-cidr-subnet
  availability_zone       = var.pub-cidr-az
  tags = {
    Name = "Pub-SN-1"
  }
}

resource "aws_subnet" "private-subnet" {
  vpc_id            = aws_vpc.default.id
  cidr_block        = var.private-cidr-subnet
  availability_zone = var.pri-cidr-az
  tags = {
    Name = "Pri-SN-1"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.default.id
  tags = {
    Name = "IGW-${aws_vpc.default.tags.Name}"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.default.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.default.id
}

resource "aws_route_table_association" "public-association" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.public_rt.id

}

resource "aws_route_table_association" "private-association" {
  subnet_id      = aws_subnet.private-subnet.id
  route_table_id = aws_route_table.private_rt.id
}

# resource "aws_internet_gateway" "default" {
#     vpc_id = "${aws_vpc.default.id}"
# 	tags = {
#         Name = "IGW-${aws_vpc.default.tags.Name}"
#     }
# }

# locals {
#   count = "${length(data.aws_availability_zones.azs.names)}"
# }

# resource "aws_subnet" "public-subnet" {
#     count = local.count
#     vpc_id = "${aws_vpc.default.id}"
#     map_public_ip_on_launch = true
#     cidr_block = "${cidrsubnet(var.vpc_cidr, 8, count.index)}"
#     availability_zone = "${element(data.aws_availability_zones.azs.names,count.index)}"
#     tags = {
#         Name = "PUB-SN-${count.index+1}-${aws_vpc.default.tags.Name}"
#     }
# }

# # resource "aws_subnet" "private-subnet" {
# #     count = local.count
# #     vpc_id = "${aws_vpc.default.id}"
# #     map_public_ip_on_launch = true
# #     cidr_block = "${cidrsubnet(var.vpc_cidr, 7, count.index + length(data.aws_availability_zones.azs.names))}"
# #     availability_zone = "${element(data.aws_availability_zones.azs.names,count.index)}"
# #     tags = {
# #         Name = "PRI-SN-${count.index+1}-${aws_vpc.default.tags.Name}"
# #     }
# # }

# resource "aws_route_table" "terraform-public" {
#     vpc_id = "${aws_vpc.default.id}"
#     route {
#         cidr_block = "0.0.0.0/0"
#         gateway_id = "${aws_internet_gateway.default.id}"
#     }
#     tags = {
#         Name = "Public-RT-${aws_vpc.default.tags.Name}"
#     }
# }

# # resource "aws_route_table" "terraform-private" {
# #     vpc_id = "${aws_vpc.default.id}"
# #     tags = {
# #         Name = "private-RT-${aws_vpc.default.tags.Name}"
# #     }
# # }

# resource "aws_route_table_association" "terraform-public" {
#     count = local.count
#     subnet_id = "${element(aws_subnet.public-subnet.*.id, count.index)}"
#     route_table_id = "${aws_route_table.terraform-public.id}"
# }

# # resource "aws_route_table_association" "terraform-private" {
# #     count = local.count
# #     subnet_id = "${element(aws_subnet.private-subnet.*.id, count.index)}"
# #     route_table_id = "${aws_route_table.terraform-private.id}"
# # }

# # resource "aws_route_table_association" "terraform-private" {
# #     count = local.count
# #     subnet_id = "${element(aws_subnet.private-subnet.*.id, count.index)}"
# #     route_table_id = "${aws_route_table.terraform-private.id}"
# # }

# resource "aws_security_group" "allow_all" {
#   name        = "SG-AA-${aws_vpc.default.tags.Name}"
#   description = "Allow_All"
#   vpc_id      = "${aws_vpc.default.id}"
#   ingress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   egress {
#     from_port       = 0
#     to_port         = 0
#     protocol        = "-1"
#     cidr_blocks     = ["0.0.0.0/0"]
#     }
# }