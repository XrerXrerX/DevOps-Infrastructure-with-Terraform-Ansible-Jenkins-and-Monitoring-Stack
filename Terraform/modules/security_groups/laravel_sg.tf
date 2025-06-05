#file: modules/security_groups/laravel_sg.tf
resource "aws_security_group" "prod_laravel" {
  name        = "prod_sg_laravel_all"
  description = "Laravel Apps - Allow from Nginx, Bastion, internal Laravel"
  vpc_id      = var.vpc_id

  # Nginx → Laravel (HTTP/HTTPS/Vite)
  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.prod_nginx.id]
  }

  #pusher 
  ingress {
  from_port       = 8080
  to_port         = 8080
  protocol        = "tcp"
  security_groups = [aws_security_group.prod_nginx.id]
}
  # Nginx → Laravel (custom Nginx ports)
ingress {
  from_port       = 8081
  to_port         = 8081
  protocol        = "tcp"
  security_groups = [aws_security_group.prod_nginx.id]
}

ingress {
  from_port       = 8082
  to_port         = 8082
  protocol        = "tcp"
  security_groups = [aws_security_group.prod_nginx.id]
}

ingress {
  from_port       = 8083
  to_port         = 8083
  protocol        = "tcp"
  security_groups = [aws_security_group.prod_nginx.id]
}

ingress {
  from_port       = 8084
  to_port         = 8084
  protocol        = "tcp"
  security_groups = [aws_security_group.prod_nginx.id]
}

ingress {
  from_port       = 4141
  to_port         = 4141
  protocol        = "tcp"
  security_groups = [aws_security_group.prod_nginx.id]
}

  ingress {
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    security_groups = [aws_security_group.prod_nginx.id]
  }

  ingress {
    from_port       = 7171
    to_port         = 7171
    protocol        = "tcp"
    security_groups = [aws_security_group.prod_nginx.id]
  }

  # SSH from Bastion
  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.prod_bastion.id,
    aws_security_group.prod_jenkins_prometheus.id]
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

  # Internal Laravel <-> Laravel communication
  ingress {
    from_port = 0
    to_port   = 65535
    protocol  = "tcp"
    self      = true
  }


  ingress {
  from_port       = 4173
  to_port         = 4173
  protocol        = "tcp"
  security_groups = [aws_security_group.prod_frontend_service.id]
}

# EFS INGGRESS PENAMBAHAN 
# ingress {
#   from_port   = 2049
#   to_port     = 2049
#   protocol    = "tcp"
#   security_groups = [aws_security_group.prod_laravel.id]
# }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
