#file: modules/ec2/frontend.tf
resource "aws_instance" "frontend_service" {
  count                       = 2  # <-- deploy 2 instance
  ami                         = "ami-01938df366ac2d954"
  instance_type               = "t2.micro"
  subnet_id                   = var.private_subnet_id
  vpc_security_group_ids      = [var.frontend_service_sg_id]
  key_name                    = var.key_name
  associate_public_ip_address = false

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install nginx -y
              echo "Frontend Service" > /var/www/html/index.html
            EOF

  tags = {
    Name = "prod_ec2_frontend_service_${count.index + 1}"
  }
}
