resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name       = "${terraform.workspace}_recovery_vpc"
  }
}

#Create IGW
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "{terraform.workspace}_recovery_IGW"
  }
}

#creating public subnet
resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, 0)
  availability_zone = var.availability_zone

  tags = {
    Name = "${terraform.workspace}_recovery_public_subnet"
  }
}

#Associating public subnets with route table
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_vpc.main.main_route_table_id
}

# Adding the internet gateway route to main route table
resource "aws_default_route_table" "example" {
  default_route_table_id = aws_vpc.main.main_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  
  tags = {
    Name = "${terraform.workspace}_recovery_RT"
  }
}