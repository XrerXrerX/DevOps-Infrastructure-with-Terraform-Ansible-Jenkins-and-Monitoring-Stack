# File: main.tf
module "vpc" {
  source = "./modules/vpc"
}

module "security_groups" {
  source = "./modules/security_groups"
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source                = "./modules/ec2"
  vpc_id                = module.vpc.vpc_id
  public_subnet_id     = module.vpc.public_subnet_id
  private_subnet_id    = module.vpc.private_subnet_id
  bastion_sg_id        = module.security_groups.bastion_sg_id
  jenkins_prometheus_sg_id        = module.security_groups.jenkins_prometheus_sg_id
  nginx_sg_id          = module.security_groups.nginx_sg_id
  frontend_service_sg_id = module.security_groups.frontend_service_sg_id
  laravel_sg_id = module.security_groups.laravel_sg_id
  mysql_master_sg_id   = module.security_groups.mysql_master_sg_id
  mysql_slave_sg_id    = module.security_groups.mysql_slave_sg_id
}