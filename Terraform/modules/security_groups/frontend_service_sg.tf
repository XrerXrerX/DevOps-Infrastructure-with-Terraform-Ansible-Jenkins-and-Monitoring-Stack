# prod modul automation/modules/security_groups/frontend_service_sg.tf
resource "aws_security_group" "prod_frontend_service" {
  name        = "prod_sg_frontend_service"
  description = "Frontend service EC2 - Access from Bastion & Nginx"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.prod_bastion.id,
    aws_security_group.prod_jenkins_prometheus.id
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

  # Dari IP publik tertentu (SSH langsung ke instance)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [
      "37.19.205.165/32",
      "103.164.183.78/32"
    ]
  }
  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.prod_nginx.id]
  }
  ingress {
  from_port       = 3000
  to_port         = 3000
  protocol        = "tcp"
  security_groups = [aws_security_group.prod_nginx.id]
  }

  ingress {
  from_port       = 4173
  to_port         = 4173
  protocol        = "tcp"
  security_groups = [aws_security_group.prod_nginx.id]
  }

  ingress {
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    security_groups = [aws_security_group.prod_nginx.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
