# create an aws VPC as a module

resource "aws_vpc" "stack-example-vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "my-module-vpc"
  }
}

resource "aws_internet_gateway" "gateway" {
  depends_on = [aws_vpc.stack-example-vpc]
  vpc_id = aws_vpc.stack-example-vpc.id
  tags = {
    Name = "my-module-VPC-internet-Gateway"
  }
}

resource "aws_route_table" "public-route" {
  depends_on = [aws_internet_gateway.gateway, aws_subnet.public-subnet ]
  vpc_id = aws_vpc.stack-example-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway.id
  }

  tags = {
    Name = "my-module-Pub-subnet-route"
  }
}

resource "aws_subnet" "public-subnet" {
  depends_on = [ aws_vpc.stack-example-vpc ]
  cidr_block        = var.public_subnet_cidr
  vpc_id            = aws_vpc.stack-example-vpc.id
  availability_zone = "us-west-2a"
  map_public_ip_on_launch = "true" 
  tags = {
    Name = "my module Public Subnet"
  }
}

resource "aws_route_table_association" "public-subnet" {
  depends_on = [ aws_route_table.public-route, aws_subnet.public-subnet ]
  route_table_id = aws_route_table.public-route.id
  subnet_id      = aws_subnet.public-subnet.id
}
