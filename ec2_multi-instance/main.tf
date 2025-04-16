resource "aws_instance" "ec2_instances" {
  for_each = { for idx, instance in var.instances : idx => instance }

  ami = "ami-xxxxx"  #  AMI ID for the region
  instance_type = each.value.instance_type
  key_name      = each.value.key_name

  root_block_device {
    volume_type = each.value.volume_type
    volume_size = each.value.volume_size
  }

  tags = {
    Name = "EC2-Instance-${each.key}"
  }
}
