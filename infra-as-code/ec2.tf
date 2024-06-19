resource "aws_eip" "ip" {
  instance = aws_instance.web_server.id
  tags = {
    Name = "elastic-ip"
  }
}

resource "aws_instance" "web_server" {
  ami = "ami-08a0d1e16fc3f61ea"
  instance_type = "t2.micro"
  key_name = "Personal"

  subnet_id = aws_subnet.subnet_public_1ab.id
  vpc_security_group_ids = [
    aws_security_group.web_server_sg.id
  ]

  user_data = <<-EOF
              #"/bin/bash
              sudo yum update -y
              sudo yum install nginx -y
              sudo systemctl start ngnix
              sudo systemctl enable ngnix
              sudo mkdir -p /var/www/html
              sudo chown -R ec2-user:ec2-user /var/www/html
              sudo chmod -R 775 /var/www/html
              sudo echo "<html><body><h1>João Felipe Mendes de Souza</h1></body></html>" > /var/www/html/index.html
              sudo systemctl restart nginx
              EOF

  tags = {
    Name = "web-server"
  }
}