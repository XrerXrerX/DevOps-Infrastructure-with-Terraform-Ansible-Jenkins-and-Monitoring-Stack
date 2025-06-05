#file: modules/ec2/bastion.tf
resource "aws_instance" "bastion" {
  ami                         = "ami-01938df366ac2d954"
  instance_type               = "t3.small"
  subnet_id                   = var.public_subnet_id
  vpc_security_group_ids      = [var.bastion_sg_id]
  key_name                    = var.key_name
  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update && sudo apt upgrade -y
              sudo apt install -y software-properties-common
              sudo add-apt-repository --yes --update ppa:ansible/ansible
              sudo apt install -y ansible
              ansible --version
            EOF
            
  tags = {
    Name = "prod_ec2_bastion_host"
  }
}

resource "aws_eip" "bastion" {
  vpc      = true
  instance = aws_instance.bastion.id

  tags = {
    Name = "eip_bastion"
  }
}
