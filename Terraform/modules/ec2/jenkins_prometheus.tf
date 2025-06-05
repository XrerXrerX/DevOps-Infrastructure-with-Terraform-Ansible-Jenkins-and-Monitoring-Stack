#file: modules/ec2/jenkins_prometheus.tf
resource "aws_instance" "jenkins_prometheus" {
  ami                         = "ami-01938df366ac2d954"
  instance_type               = "t3.small"
  subnet_id                   = var.public_subnet_id
  vpc_security_group_ids      = [var.jenkins_prometheus_sg_id]
  key_name                    = var.key_name
  associate_public_ip_address = true

  # user_data = <<-EOF
  #             #!/bin/bash
  #             sudo apt update && sudo apt upgrade -y
  #             sudo apt install -y software-properties-common
  #             sudo add-apt-repository --yes --update ppa:ansible/ansible
  #             sudo apt install -y ansible
  #             ansible --version
  #           EOF

  tags = {
    Name = "prod_ec2_jenkins_prometheus"
  }
}

resource "aws_eip" "jenkins_prometheus" {
  vpc      = true
  instance = aws_instance.jenkins_prometheus.id

  tags = {
    Name = "eip_jenkins_prometheus"
  }
}
