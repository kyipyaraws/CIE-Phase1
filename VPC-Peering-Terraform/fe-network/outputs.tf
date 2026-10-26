output "frontend_vpc_id" {
  value = aws_vpc.frontend_vpc.id
}

output "frontend_vpc_cidr" {
  value = aws_vpc.frontend_vpc.cidr_block
}

output "frontend_private_rtb02_id" {
  value = aws_route_table.frontend_private_rtb02.id
}

output "frontend_private_rtb03_id" {
  value = aws_route_table.frontend_private_rtb03.id
}

output "frontend_private_subnet02_cidr" {
  value = aws_subnet.frontend_private_subnet02.cidr_block
}

output "frontend_private_subnet03_cidr" {
  value = aws_subnet.frontend_private_subnet03.cidr_block
}

output "frontend_private_subnet01_id" {
  value = aws_subnet.frontend_private_subnet01.id
}

output "frontend_private_subnet02_id" {
  value = aws_subnet.frontend_private_subnet02.id
}

output "frontend_private_subnet03_id" {
  value = aws_subnet.frontend_private_subnet03.id
}

output "frontend_public_subnet01_id" {
  value = aws_subnet.frontend_public_subnet01.id
}