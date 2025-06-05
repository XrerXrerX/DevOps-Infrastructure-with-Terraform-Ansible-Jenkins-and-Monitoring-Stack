#file: modules/security_groups/nginx_sg.tf

resource "aws_security_group" "prod_nginx" {
  name        = "prod_sg_nginx_proxy"
  description = "Allow HTTP/HTTPS from internet, SSH from bastion"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description     = "SSH from Bastion"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.prod_bastion.id,
    aws_security_group.prod_jenkins_prometheus.id]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [
      "37.19.205.165/32",
      "103.164.183.78/32",
      "52.221.89.250/32"
    ]
  }

#open port prometheus
    ingress {
        from_port       = 9100
        to_port         = 9100
        protocol        = "tcp"
        security_groups = [
        aws_security_group.prod_jenkins_prometheus.id
    ]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
