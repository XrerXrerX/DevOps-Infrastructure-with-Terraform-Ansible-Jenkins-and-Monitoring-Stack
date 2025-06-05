# variable "name" {
#   description = "Name of the EFS File System"
#   type        = string
# }

# variable "throughput_mode" {
#   description = "Throughput mode for EFS"
#   type        = string
#   default     = "bursting"
# }

# variable "subnet_ids" {
#   description = "List of private subnet IDs to create mount targets in"
#   type        = list(string)
# }

# variable "efs_sg_id" {
#   description = "Security group ID to attach to EFS mount targets"
#   type        = string
# }