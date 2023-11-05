output "vpc_id" {
  value = aws_vpc.stack-example-vpc.id
}

output "public_subnet_ids" {
  value = aws_subnet.public-subnet.id
}
  
