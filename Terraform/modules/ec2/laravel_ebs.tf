# resource "aws_ebs_volume" "laravel_data" {
#   availability_zone = "ap-southeast-2a"
#   size              = 20
#   type              = "gp3"
#   tags = {
#     Name = "laravel1-data"
#   }
# }

# resource "aws_volume_attachment" "laravel_data_attach" {
#   device_name = "/dev/xvdf"
#   instance_id = aws_instance.laravel_1.id
#   volume_id   = aws_ebs_volume.laravel_data.id
# }

# resource "aws_ebs_volume" "laravel_data2" {
#   availability_zone = "ap-southeast-2a"
#   size              = 20
#   type              = "gp3"
#   tags = {
#     Name = "laravel2-data"
#   }
# }

# resource "aws_volume_attachment" "laravel_data_attach2" {
#   device_name = "/dev/xvdf"
#   instance_id = aws_instance.laravel_2.id
#   volume_id   = aws_ebs_volume.laravel_data2.id
# }


# jalankan mounting dengan ansible jika sudah di mpunt dan ingin di pakai