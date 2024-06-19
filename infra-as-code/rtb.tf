resource "aws_route_table" "rtb" {
  vpc_id = aws_vpc.vpc_lab.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_1ab.id
  }

  tags = {
    Name = "rtb"
    Owner = "ms.joao.felipe@gmail.com"
  }
}

resource "aws_route_table_association" "subnet_public_association" {
  subnet_id      = aws_subnet.subnet_public_1ab.id
  route_table_id = aws_route_table.rtb.id
}
