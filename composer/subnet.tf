resource "aws_subnet" "subnet_1" {
  vpc_id     = aws_vpc.composer.id
  cidr_block = var.subnet_1_values.cidr_block
  map_public_ip_on_launch = var.subnet_1_values.map_public_ip_on_launch
  availability_zone = var.subnet_1_values.availability_zone
  
  tags = {
    Name = "subnet_1"
  }
}

resource "aws_subnet" "subnet_2" {
  vpc_id     = aws_vpc.composer.id
  cidr_block = var.subnet_2_values.cidr_block
  map_public_ip_on_launch = var.subnet_2_values.map_public_ip_on_launch
  availability_zone = var.subnet_2_values.availability_zone
  
  tags = {
    Name = "subnet_2"
  }
}
