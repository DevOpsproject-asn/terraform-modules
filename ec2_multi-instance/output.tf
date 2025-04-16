output "instance_ids" {
  description = "The IDs of the created EC2 instances"
  value = aws_instance.ec2_instances[*].id
}

output "instance_public_ips" {
  description = "The public IPs of the created EC2 instances"
  value = aws_instance.ec2_instances[*].public_ip
}
output "instance_private_ips" {
  description = "The private IPs of the created EC2 instances"
  value = aws_instance.ec2_instances[*].private_ip
}