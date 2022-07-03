resource "aws_route_table" "route_table_01" {
  vpc_id = aws_vpc.composer.id

  route {
    cidr_block = var.route_table.cidr_block
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name = "route-table-01"
  }
}

resource "aws_route_table_association" "route_table_association_dmz_01"{
 subnet_id = aws_subnet.subnet_dmz_01.id
 route_table_id = aws_route_table.route_table_01.id
}

resource "aws_route_table_association" "route_table_association_dmz_02"{
 subnet_id = aws_subnet.subnet_dmz_02.id
 route_table_id = aws_route_table.route_table_01.id
}

resource "aws_route_table" "route_table_02" {
  vpc_id = aws_vpc.composer.id

  tags = {
    Name = "route-table-02"
  }
}

resource "aws_route_table_association" "route_table_association_01"{
 subnet_id = aws_subnet.subnet_01.id
 route_table_id = aws_route_table.route_table_02.id
}

resource "aws_route_table_association" "route_table_association_02"{
 subnet_id = aws_subnet.subnet_02.id
 route_table_id = aws_route_table.route_table_02.id
}

resource "aws_route" "route_table_nat" {
  route_table_id              = aws_route_table.route_table_02.id
  destination_cidr_block      = var.route_table.cidr_block
  nat_gateway_id              = aws_nat_gateway.nat_gateway.id
}