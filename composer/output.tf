output "vpc_id" {
  value       = aws_vpc.composer.id
  description = "The AWS vpc id"
}

output "vpc_arn" {
  value       = aws_vpc.composer.arn
  description = "The AWS vpc arn"
}

output "subnet_dmz_01" {
  value = aws_subnet.subnet_dmz_01.id
  description = "The AWS subnet dmz 01 id"
}

output "subnet_dmz_02" {
  value = aws_subnet.subnet_dmz_02.id
  description = "The AWS subnet dmz 02 id"
}

output "subnet_01" {
  value = aws_subnet.subnet_01.id
  description = "The AWS subnet subnet 01 id"
}

output "subnet_02" {
  value = aws_subnet.subnet_02.id
  description = "The AWS subnet subnet 02 id"
}

output "database_subnet_01" {
  value = aws_subnet.database_subnet_01.id
  description = "The AWS subnet database subnet 01 id"
}

output "aws_route_table_01" {
  value = aws_route_table.route_table_01.id
  description = "The AWS route table 01 id"
}

output "aws_route_table_02" {
  value = aws_route_table.route_table_02.id
  description = "The AWS route table 02 id"
}

output "aws_internet_gateway" {
  value = aws_internet_gateway.internet_gateway.id
  description = "The AWS route internet gateway id"
}