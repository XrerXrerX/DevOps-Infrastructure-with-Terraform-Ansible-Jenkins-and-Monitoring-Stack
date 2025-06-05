#file: modules/vpc/subnet.tf
resource "aws_subnet" "prod_public" {
  vpc_id                  = aws_vpc.prod.id
  cidr_block              = "10.1.1.0/24"
  availability_zone       = "ap-southeast-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "subnet_public_bastion_nginx"
  }
}

resource "aws_subnet" "prod_private" {
  vpc_id            = aws_vpc.prod.id
  cidr_block        = "10.1.2.0/24"
  availability_zone = "ap-southeast-1a"

  tags = {
    Name = "subnet_private_services"
  }
}
