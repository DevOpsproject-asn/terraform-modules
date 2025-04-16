variable "instances" {
  description = "List of EC2 instances with configurations"
  type = list(object({
    instance_type = string
    volume_type   = string
    volume_size   = number
    key_name      = string
  }))
}