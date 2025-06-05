# output "efs_id" {
#   description = "ID of the EFS file system"
#   value       = aws_efs_file_system.this.id
# }

# output "efs_dns_names" {
#   description = "Private DNS names for mount targets"
#   value       = [for target in aws_efs_mount_target.this : target.dns_name]
# }
