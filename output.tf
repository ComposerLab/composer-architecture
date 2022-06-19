output "vpc_id" {
  value       = aws_vpc.composer.id
  description = "The AWS vpc id"
}

output "vpc_arn" {
  value       = aws_vpc.composer.arn
  description = "The AWS vpc arn"
}

output "subnet_1" {
  value = aws_subnet.subnet_1.id
  description = "The AWS subnet public subnet 1 id"
}

output "subnet_2" {
  value = aws_subnet.subnet_2.id
  description = "The AWS subnet public subnet 2 id"
}

output "aws_route_table" {
  value = aws_route_table.rt_1.id
  description = "The AWS route table id"
}

output "aws_internet_gateway" {
  value = aws_internet_gateway.internet_gateway.id
  description = "The AWS route internet gateway id"
}