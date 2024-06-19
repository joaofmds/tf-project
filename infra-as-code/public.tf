resource "aws_subnet" "subnet_public_1ab" {
  vpc_id = aws_vpc.vpc_lab.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "subnet-public"
    Owner = "ms.joao.felipe@gmail.com"
  }
}