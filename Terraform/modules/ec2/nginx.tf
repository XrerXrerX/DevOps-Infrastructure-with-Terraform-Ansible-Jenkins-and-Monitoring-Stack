#file: modules/ec2/nginx.tf
resource "aws_instance" "nginx" {
  ami                         = "ami-01938df366ac2d954"
  instance_type               = "t2.micro"
  subnet_id                   = var.public_subnet_id
  vpc_security_group_ids      = [var.nginx_sg_id]
  key_name                    = var.key_name
  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install nginx -y
              echo "Nginx Proxy" > /var/www/html/index.html
            EOF

  tags = {
    Name = "prod_ec2_nginx_proxy"
  }
}

resource "aws_eip" "nginx" {
  vpc      = true
  instance = aws_instance.nginx.id

  tags = {
    Name = "eip_nginx"
  }
}
