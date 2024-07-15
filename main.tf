module "vpc" {
  source = "./modules/vpc"

  vpc_cidr = var.vpc_cidr

  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs

  public_subnet_azs = ["${var.region}a", "${var.region}b", "${var.region}c"]

  private_subnet_azs = ["${var.region}a", "${var.region}b", "${var.region}c"]

  public_subnet_name  = var.public_subnet_name_id
  private_subnet_name = var.private_subnet_name_id

  # Tags
  vpc_name      = var.vpc_name
  contact_email = var.contact_email
  contact_name  = var.contact_name
}

module "ec2_vms" {
  source           = "./modules/ec2_vms"
  depends_on       = [module.vpc]
  instance_count   = var.instance_count
  ami_id           = var.ami_id
  instance_type    = var.instance_type
  key_pair_name    = var.key_pair_name
  subnet_id        = module.vpc.public_subnet_ids
  security_group   = [aws_security_group.main.id]
  volume_size      = var.volume_size
  private_key_path = var.private_key_path
  # Tags
  name                 = var.name
  owner                = var.owner
  team                 = var.team
  purpose              = var.purpose
  auto_shutdown_bypass = var.auto_shutdown_bypass
  inline_user-data     = var.inline_user-data
  alarm_name           = var.alarm_name
}
