output "instance_ids" {
  value = aws_instance.ec2_vms.*.id
}

output "aws_dynamic_ami_id" {
  value = data.aws_ami.ubuntu.id
}

output "dns_names" {
  value = aws_instance.ec2_vms.*.public_dns
}