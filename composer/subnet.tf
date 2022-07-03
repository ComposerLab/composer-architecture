resource "aws_subnet" "subnet_dmz_01" {
  vpc_id     = aws_vpc.composer.id
  cidr_block = var.subnet_dmz_01_values.cidr_block
  map_public_ip_on_launch = var.subnet_dmz_01_values.map_public_ip_on_launch
  availability_zone = var.subnet_dmz_01_values.availability_zone
  
  tags = {
    Name = "subnet_dmz_01"
  }
}

resource "aws_subnet" "subnet_dmz_02" {
  vpc_id     = aws_vpc.composer.id
  cidr_block = var.subnet_dmz_02_values.cidr_block
  map_public_ip_on_launch = var.subnet_dmz_02_values.map_public_ip_on_launch
  availability_zone = var.subnet_dmz_02_values.availability_zone
  
  tags = {
    Name = "subnet_dmz_02"
  }
}

resource "aws_subnet" "subnet_01" {
  vpc_id     = aws_vpc.composer.id
  cidr_block = var.subnet_01_values.cidr_block
  map_public_ip_on_launch = var.subnet_01_values.map_public_ip_on_launch
  availability_zone = var.subnet_01_values.availability_zone
  
  tags = {
    Name = "subnet_01"
  }
}

resource "aws_subnet" "subnet_02" {
  vpc_id     = aws_vpc.composer.id
  cidr_block = var.subnet_02_values.cidr_block
  availability_zone = var.subnet_02_values.availability_zone
  
  tags = {
    Name = "subnet_02"
  }
}

resource "aws_subnet" "database_subnet_01" {
  vpc_id     = aws_vpc.composer.id
  cidr_block = var.database_subnet_01_values.cidr_block
  availability_zone = var.database_subnet_01_values.availability_zone
  
  tags = {
    Name = "database_subnet_01"
  }
}

# resource "aws_subnet" "database_subnet_02" {
#   vpc_id     = aws_vpc.composer.id
#   cidr_block = var.database_subnet_02_values.cidr_block
#   availability_zone = var.database_subnet_02_values.availability_zone
  
#   tags = {
#     Name = "database_subnet_02"
#   }
# }

