terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.54.1"
    }
  }
}
resource "aws_vpc" "main" {
  cidr_block = var.cidr_block
  tags = {
    Name = "${var.env}-vpc"
  }
}

resource "aws_subnet" "subnet" {
  for_each = var.subnets
  vpc_id = aws_vpc.main.id
  cidr_block = each.value["cidr_block"]
  tags = {
    Name = "${var.env}-${each.key}"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.env}-igw"
  }
}

resource "aws_vpc_peering_connection" "main" {
  peer_vpc_id = var.default_vpc["id"]
  vpc_id      = aws_vpc.main.id
  auto_accept = true
}

resource "aws_route" "main" {
  route_table_id = aws_vpc.main.default_route_table_id
  destination_cidr_block = var.default_vpc["cidr"]
  vpc_peering_connection_id = aws_vpc_peering_connection.main.id
}

resource "aws_route" "igw" {
  route_table_id = aws_vpc.main.default_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.main.id
}

resource "aws_route" "default-vpc-route-table" {
  route_table_id = var.default_vpc["route_table"]
  destination_cidr_block = var.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.main.id
}

resource "aws_security_group" "test" {
  name = "test"
  vpc_id = aws_vpc.main.id
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "test" {
  ami = "ami-0ed79e09b5c35fc77"
  instance_type = "t3.small"
  vpc_security_group_ids = [aws_security_group.test.id]
  subnet_id = aws_subnet.subnet["one"].id
  associate_public_ip_address = true
}