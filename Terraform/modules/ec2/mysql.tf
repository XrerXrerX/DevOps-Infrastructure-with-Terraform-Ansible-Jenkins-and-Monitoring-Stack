#file: modules/ec2/mysql.tf

resource "aws_instance" "mysql_master" {
  ami                         = "ami-01938df366ac2d954"
  instance_type               = "t2.micro"
  subnet_id                   = var.private_subnet_id
  vpc_security_group_ids      = [var.mysql_master_sg_id]
  key_name                    = var.key_name
  associate_public_ip_address = false

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install mysql-server -y
              echo "MySQL Master" > /var/www/html/index.html
            EOF

  tags = {
    Name = "prod_ec2_mysql_master"
  }
}

resource "aws_instance" "mysql_slave" {
  ami                         = "ami-01938df366ac2d954"
  instance_type               = "t2.micro"
  subnet_id                   = var.private_subnet_id
  vpc_security_group_ids      = [var.mysql_slave_sg_id]
  key_name                    = var.key_name
  associate_public_ip_address = false

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install mysql-server -y
              echo "MySQL Slave" > /var/www/html/index.html
            EOF

  tags = {
    Name = "prod_ec2_mysql_slave"
  }
}
