variable "vpc_id" {
  type = string
}
variable "public_subnet_id" {
  type = string
}
variable "private_subnet_id" {
  type = string
}
variable "bastion_sg_id" {
  type = string
}
variable "jenkins_prometheus_sg_id" {
  type = string
}
variable "nginx_sg_id" {
  type = string
}
variable "laravel_sg_id" {
  type = string
}
variable "mysql_master_sg_id" {
  type = string
}
variable "mysql_slave_sg_id" {
  type = string
}

variable "key_name" {
  type = string
  default = "key-secret-21"
}


variable "frontend_service_sg_id" {
  type = string
}

