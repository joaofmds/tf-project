resource "aws_security_group" "web_server_sg" {
  name = "web-server-sg"
  vpc_id = aws_vpc.vpc_lab.id
  description = "Web Server Security Group"

  tags = {
    Name = "web-server-sg"
    Owner = "ms.joao.felipe@gmail.com"
  }

}

resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.web_server_sg.id
  from_port = 80
  to_port = 80
  ip_protocol = "tcp"
  cidr_ipv4 = aws_vpc.vpc_lab.cidr_block
}

resource "aws_vpc_security_group_ingress_rule" "ssh" {
  security_group_id = aws_security_group.web_server_sg.id
  from_port = 22
  to_port = 22
  ip_protocol = "tcp"
  cidr_ipv4 = aws_vpc.vpc_lab.cidr_block
}

resource "aws_vpc_security_group_ingress_rule" "deny" {
  security_group_id = aws_security_group.web_server_sg.id
  from_port = 0
  to_port = 0
  ip_protocol = -1
  cidr_ipv4 = aws_vpc.vpc_lab.cidr_block
}