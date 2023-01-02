# --- modules/DEV/vpc/main.tf ---

resource "aws_vpc" "instance_vpc" {
  cidr_block = var.vpc_cidr_block
}

resource "aws_subnet" "instance_subnet" {
  vpc_id            = aws_vpc.instance_vpc.id
  availability_zone = var.az
  cidr_block        = var.subnet_cidr_block

}

resource "aws_internet_gateway" "instance_igw" {
  vpc_id = aws_vpc.instance_vpc.id
}

resource "aws_route_table" "instance_rt" {
  vpc_id = aws_vpc.instance_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.instance_igw.id
  }
}

resource "aws_route_table_association" "instance" {
  subnet_id      = aws_subnet.instance_subnet.id
  route_table_id = aws_route_table.instance_rt.id
}