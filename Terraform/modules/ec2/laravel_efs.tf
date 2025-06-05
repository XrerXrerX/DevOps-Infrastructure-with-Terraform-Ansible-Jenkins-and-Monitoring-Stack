# resource "aws_efs_file_system" "shared" {
#   creation_token = "laravel-shared"
#   throughput_mode = "bursting"
#   tags = {
#     Name = "laravel-shared-storage"
#   }
# }

# resource "aws_efs_mount_target" "target" {
#   for_each       = toset(var.subnet_ids)
#   file_system_id = aws_efs_file_system.shared.id
#   subnet_id      = each.value
#   security_groups = [var.efs_sg_id]
# }
