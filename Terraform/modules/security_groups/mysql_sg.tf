#file: modules/security_groups/mysql_sg.tf
resource "aws_security_group" "prod_mysql_master" {
  name        = "prod_sg_mysql_master"
  description = "MySQL master - Allow from Laravel + Bastion"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.prod_laravel.id]
  }
    ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.prod_bastion.id,
    aws_security_group.prod_jenkins_prometheus.id]
  }
  
      ingress {
        from_port       = 9100
        to_port         = 9100
        protocol        = "tcp"
        security_groups = [
        aws_security_group.prod_jenkins_prometheus.id
    ]
  }
  
  ingress {
  description     = "MySQL from MySQL Slave"
  from_port       = 3306
  to_port         = 3306
  protocol        = "tcp"
  security_groups = [aws_security_group.prod_mysql_slave.id]
}


  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.prod_bastion.id,
    aws_security_group.prod_jenkins_prometheus.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_security_group" "prod_mysql_slave" {
  name        = "prod_sg_mysql_slave_v2"
  description = "Allow SSH from Bastion"
  vpc_id      = var.vpc_id

    ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.prod_bastion.id,
    aws_security_group.prod_jenkins_prometheus.id]
  }
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
  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.prod_laravel.id]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
