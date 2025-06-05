# resource "aws_instance" "laravel" {
#   count                       = var.instance_count
#   ami                         = var.ami
#   instance_type               = var.instance_type
#   subnet_id                   = var.private_subnet_id
#   vpc_security_group_ids      = [var.laravel_sg_id]
#   key_name                    = var.key_name
#   associate_public_ip_address = false

#   tags = {
#     Name = "laravel${count.index + 1}"
#   }

#   user_data = <<-EOF
#               #!/bin/bash
#               apt update -y
#               apt install nginx -y
#               echo "Laravel App ${count.index + 1}" > /var/www/html/index.html
#               EOF
# }