#file: modules/ec2/outputs.tf
output "bastion_public_ip" {
  value = aws_eip.bastion.public_ip
}

output "jenkins_prometheus_public_ip" {
  value = aws_eip.jenkins_prometheus.public_ip
}

output "nginx_public_ip" {
  value = aws_eip.nginx.public_ip
}

output "laravel_1_private_ip" {
  value = aws_instance.laravel_1.private_ip
}

output "laravel_2_private_ip" {
  value = aws_instance.laravel_2.private_ip
}

output "laravel_3_private_ip" {
  value = aws_instance.laravel_3.private_ip
}

output "laravel_4_private_ip" {
  value = aws_instance.laravel_4.private_ip
}

output "mysql_master_private_ip" {
  value = aws_instance.mysql_master.private_ip
}

output "mysql_slave_private_ip" {
  value = aws_instance.mysql_slave.private_ip
}

output "frontend_service_private_ip" {
  value = [for instance in aws_instance.frontend_service : instance.private_ip]
}


output "mysql_master_private_dns" {
  value = aws_instance.mysql_master.private_dns
}

output "mysql_slave_private_dns" {
  value = aws_instance.mysql_slave.private_dns
}


output "nginx_private_ip" {
  value = aws_instance.nginx.private_ip
}

output "bastion_private_ip" {
  value = aws_instance.bastion.private_ip
}
output "jenkins_prometheus_private_ip" {
  value = aws_instance.jenkins_prometheus.private_ip
}

output "laravel_1_private_dns" {
  value = aws_instance.laravel_1.private_dns
}

output "laravel_2_private_dns" {
  value = aws_instance.laravel_2.private_dns
}

output "laravel_3_private_dns" {
  value = aws_instance.laravel_3.private_dns
}

output "laravel_4_private_dns" {
  value = aws_instance.laravel_4.private_dns
}
