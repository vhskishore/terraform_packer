output "vpc_id" {
    value = "${aws_vpc.default.id}"
}

output "vpc_name" {
    value = "${aws_vpc.default.tags.Name}"
}


output "public_cidrs" {
    value = "${aws_subnet.public-subnet.*.cidr_block}"
  
}

output "private_cidrs" {
    value = "${aws_subnet.private-subnet.*.cidr_block}"
  
}

output "public_subnet_azs" {
    value = "${aws_subnet.public-subnet.*.availability_zone}"
  
}

output "private_subnet_azs" {
    value = "${aws_subnet.private-subnet.*.availability_zone}"
  
}

output "igw_id" {
    value = "${aws_internet_gateway.default.id}"
  
}

output "SG" {
    value = "${aws_security_group.allow_all.ingress}"
}