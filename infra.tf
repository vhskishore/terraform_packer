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

resource "aws_security_group" "sg" {
  name        = "SG-AA-${aws_vpc.default.tags.Name}"
  description = "Allow_ALL"
  vpc_id      = aws_vpc.default.id
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}