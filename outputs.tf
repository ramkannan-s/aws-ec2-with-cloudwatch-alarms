output "vpc_cidr" {
  value = module.vpc.vpc_cidr
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "instance_ids" {
  value = module.ec2_vms.*
}

output "dns_names" {
  value = module.ec2_vms
}