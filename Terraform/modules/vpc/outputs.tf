# File: modules/vpc/outputs.tf

output "vpc_id" {
  value = aws_vpc.prod.id
}

output "public_subnet_id" {
  value = aws_subnet.prod_public.id
}

output "private_subnet_id" {
  value = aws_subnet.prod_private.id
}