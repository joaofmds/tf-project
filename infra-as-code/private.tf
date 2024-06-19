resource "aws_subnet" "subnet_private_1ab" {
  vpc_id = aws_vpc.vpc_lab.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "subnet-private"
    Owner = "ms.joao.felipe@gmail.com"
  }
}