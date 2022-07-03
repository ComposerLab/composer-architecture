resource "aws_eip" "nat_gateway_eip" {
  vpc = true

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "Nat Gateway EIP"
  }
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_gateway_eip.id

  # Private subnet이 아니라 public subnet을 연결하셔야 합니다.
  subnet_id = aws_subnet.subnet_dmz_01.id

  tags = {
    Name = "Nat Gateway DMZ"
  }
}