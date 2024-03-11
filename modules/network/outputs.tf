output "private" {
  value = aws_subnet.private_subnets.id
}

output "public" {
  value = aws_subnet.public_subnets.id
}

output "vpc_id" {
  value = aws_vpc.VPC.id
}

output "route_table_id" {
  value = aws_route_table.RT.id
}