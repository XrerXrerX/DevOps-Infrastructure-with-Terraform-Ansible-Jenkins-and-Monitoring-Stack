#file: modules/security_groups/outputs.tf
output "bastion_sg_id" {
  value = aws_security_group.prod_bastion.id
}
output "jenkins_prometheus_sg_id" {
  value = aws_security_group.prod_jenkins_prometheus.id
}

output "nginx_sg_id" {
  value = aws_security_group.prod_nginx.id
}

output "laravel_sg_id" {
  value = aws_security_group.prod_laravel.id
}


output "mysql_master_sg_id" {
  value = aws_security_group.prod_mysql_master.id
}

output "mysql_slave_sg_id" {
  value = aws_security_group.prod_mysql_slave.id
}

output "frontend_service_sg_id" {
  value = aws_security_group.prod_frontend_service.id
}

