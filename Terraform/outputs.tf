# File: outputs.tf
output "bastion_public_ip" {
  value = module.ec2.bastion_public_ip
}
output "jenkins_prometheus_public_ip" {
  value = module.ec2.jenkins_prometheus_public_ip
}

output "nginx_public_ip" {
  value = module.ec2.nginx_public_ip
}

output "laravel_1_private_ip" {
  value = module.ec2.laravel_1_private_ip
}

output "laravel_2_private_ip" {
  value = module.ec2.laravel_2_private_ip
}

output "laravel_3_private_ip" {
  value = module.ec2.laravel_3_private_ip
}
output "laravel_4_private_ip" {
  value = module.ec2.laravel_4_private_ip
}

output "mysql_master_private_ip" {
  value = module.ec2.mysql_master_private_ip
}

output "mysql_master_private_dns" {
  value = module.ec2.mysql_master_private_dns
}

output "mysql_slave_private_dns" {
  value = module.ec2.mysql_slave_private_dns
}

output "mysql_slave_private_ip" {
  value = module.ec2.mysql_slave_private_ip
}

output "frontend_service_private_ip" {
  value = module.ec2.frontend_service_private_ip
}

output "nginx_private_ip" {
  value = module.ec2.nginx_private_ip
}

output "bastion_private_ip" {
  value = module.ec2.bastion_private_ip
}
output "jenkins_prometheus_private_ip" {
  value = module.ec2.jenkins_prometheus_private_ip
}

output "laravel_1_private_dns" {
  value = module.ec2.laravel_1_private_dns
}

output "laravel_2_private_dns" {
  value = module.ec2.laravel_2_private_dns
}
output "laravel_3_private_dns" {
  value = module.ec2.laravel_3_private_dns
}
output "laravel_4_private_dns" {
  value = module.ec2.laravel_4_private_dns
}
