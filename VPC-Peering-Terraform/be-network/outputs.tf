output "backend_vpc_id" {
  value = aws_vpc.backend_vpc.id
}

output "backend_vpc_cidr" {
  value = aws_vpc.backend_vpc.cidr_block
}

output "backend_private_rtb02_id" {
  value = aws_route_table.backend_private_rtb02.id
}

output "backend_private_rtb03_id" {
  value = aws_route_table.backend_private_rtb03.id
}

output "backend_private_subnet02_cidr" {
  value = aws_subnet.backend_private_subnet02.cidr_block
}

output "backend_private_subnet03_cidr" {
  value = aws_subnet.backend_private_subnet03.cidr_block
}

output "backend_private_subnet01_id" {
  value = aws_subnet.backend_private_subnet01.id
}

output "backend_private_subnet02_id" {
  value = aws_subnet.backend_private_subnet02.id
}

output "backendprivate_subnet03_id" {
  value = aws_subnet.backend_private_subnet03.id
}

output "backend_public_subnet01_id" {
  value = aws_subnet.backend_public_subnet01.id
}