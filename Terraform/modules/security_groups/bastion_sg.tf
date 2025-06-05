#file: modules/security_groups/bastion_sg.tf

resource "aws_security_group" "prod_bastion" {
  name        = "prod_sg_bastion"
  description = "Allow SSH from trusted IP"
  vpc_id      = var.vpc_id

ingress {
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = [
    "37.19.205.165/32",
    "103.164.183.78/32"
  ]
}

#2 ip access dan sisanya ip github
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [
      "37.19.205.165/32",
      "103.164.183.78/32",
      
  ]  
  }


  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [
      "37.19.205.165/32",
      "103.164.183.78/32"
    ]
    }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
