# output "laravel_private_ips" {
#   description = "Private IPs of the Laravel instances"
#   value       = [for instance in aws_instance.laravel : instance.private_ip]
# }

# output "laravel_private_dns" {
#   description = "Private DNS of the Laravel instances"
#   value       = [for instance in aws_instance.laravel : instance.private_dns]
# }
