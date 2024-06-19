resource "aws_internet_gateway" "igw_1ab" {
  vpc_id = aws_vpc.vpc_lab.id

  tags = {
    Name = "igw"
    Owner = "ms.joao.felipe@gmail.com"
  }
}