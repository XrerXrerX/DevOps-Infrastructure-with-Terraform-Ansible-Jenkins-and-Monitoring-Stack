# resource "aws_efs_file_system" "this" {
#   creation_token = var.name
#   throughput_mode = var.throughput_mode

#   tags = {
#     Name = var.name
#   }
# }

# resource "aws_efs_mount_target" "this" {
#   for_each = toset(var.subnet_ids)

#   file_system_id  = aws_efs_file_system.this.id
#   subnet_id       = each.value
#   security_groups = [var.efs_sg_id]
# }


# SECURITY GROUP 
#  1. Pastikan Security Group EC2 Laravel boleh akses EFS
# Port 2049 (NFS) harus diizinkan antara:
# Laravel SG → EFS SG

# Atau satu SG shared
# 2. Pastikan EC2 Laravel dan EFS berada di subnet & AZ yang sama
# Mount target harus tersedia di AZ tempat EC2 Anda berada.

# 3. Mount EFS ke EC2 Laravel
# Anda bisa lakukan dengan:
# 🅐 Ansible task (recommended, maintainable)
# Sudah saya buatkan sebelumnya (→ /mnt/laravel_data)
# 🅑 User Data script di Terraform:
# Contoh:
# hcl
# user_data = <<-EOF
#               #!/bin/bash
#               apt update -y
#               apt install -y nfs-common
#               mkdir -p /mnt/laravel_data
#               mount -t nfs4 -o nfsvers=4.1 {{ efs_dns }}:/ /mnt/laravel_data
#             EOF
# {{ efs_dns }} → ambil dari module.efs.efs_dns_names[0]

# 3. Mount EFS ke EC2 Laravel
# Anda bisa lakukan dengan:

# 4 Ansible task (recommended, maintainable)
# Sudah saya buatkan sebelumnya (→ /mnt/laravel_data)

# 🅑 User Data script di Terraform:
# Contoh:
# hcl
# user_data = <<-EOF
#               #!/bin/bash
#               apt update -y
#               apt install -y nfs-common
#               mkdir -p /mnt/laravel_data
#               mount -t nfs4 -o nfsvers=4.1 {{ efs_dns }}:/ /mnt/laravel_data
#             EOF
# {{ efs_dns }} → ambil dari module.efs.efs_dns_names[0]