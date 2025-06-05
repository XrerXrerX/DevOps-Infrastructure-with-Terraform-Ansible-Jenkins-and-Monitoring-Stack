#file: modules/ec2/laravel.tf
resource "aws_instance" "laravel_1" {
  ami                         = "ami-01938df366ac2d954"
  instance_type               = "t2.micro"
  subnet_id                   = var.private_subnet_id
  vpc_security_group_ids      = [var.laravel_sg_id]
  key_name                    = var.key_name
  associate_public_ip_address = false

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install nginx -y
              echo "Laravel App 1 with Vite" > /var/www/html/index.html
            EOF

  tags = {
    Name = "prod_ec2_laravel_dashboard"
  }
}

resource "aws_instance" "laravel_2" {
  ami                         = "ami-01938df366ac2d954"
  instance_type               = "t3.small"
  subnet_id                   = var.private_subnet_id
  vpc_security_group_ids      = [var.laravel_sg_id]
  key_name                    = var.key_name
  associate_public_ip_address = false

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install nginx -y
              echo "Laravel App 2" > /var/www/html/index.html
            EOF

  tags = {
    Name = "prod_ec2_laravel_websocket"
  }
}


resource "aws_instance" "laravel_3" {
  ami                         = "ami-01938df366ac2d954"
  instance_type               = "t2.micro"
  subnet_id                   = var.private_subnet_id
  vpc_security_group_ids      = [var.laravel_sg_id]
  key_name                    = var.key_name
  associate_public_ip_address = false

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install nginx -y
              echo "Laravel App 1 with Vite" > /var/www/html/index.html
            EOF

  tags = {
    Name = "prod_ec2_laravel_calculator"
  }
}

resource "aws_instance" "laravel_4" {
  ami                         = "ami-01938df366ac2d954"
  instance_type               = "t2.micro"
  subnet_id                   = var.private_subnet_id
  vpc_security_group_ids      = [var.laravel_sg_id]
  key_name                    = var.key_name
  associate_public_ip_address = false

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install nginx -y
              echo "Laravel App 1 with Vite" > /var/www/html/index.html
            EOF

  tags = {
    Name = "prod_ec2_laravel_seamless"
  }
}