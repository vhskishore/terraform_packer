resource "aws_instance" "public-ec2" {
  ami                         = var.pub-ami
  availability_zone           = var.pub-cidr-az
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = aws_subnet.public-subnet.id
  associate_public_ip_address = true
  tags = {
    Name  = "${var.vpc_name}-${var.env}-Server-1"
    Env = var.env
    Owner = "HSK"
  }
  lifecycle {
    prevent_destroy = true
    ignore_changes = [ tags ]
  }
}