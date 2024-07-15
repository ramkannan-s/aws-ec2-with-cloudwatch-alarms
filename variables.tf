variable "region" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "public_subnet_cidrs" {
  type = list(string)
}

variable "private_subnet_cidrs" {
  type = list(string)
}

# Tagging
variable "contact_email" {
  type = string
}

variable "contact_name" {
  type = string
}

variable "public_subnet_name_id" {
  type = string
}

variable "private_subnet_name_id" {
  type = string
}

variable "ami_id" {
  type = string
}

variable "key_pair_name" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "instance_count" {
  type = string
}

variable "volume_size" {
  type = string
}

variable "private_key_path" {
  type = string
}

variable "inline_user-data" {
  type = list(string)
}

variable "ingress_cidr_ssh" {
  description = "List of CIDR ranges to allow for SSH"
  type        = list(string)
}

# Human readable name for Ec2 Tags
variable "name" {
  type = string
}

variable "owner" {
  type = string
}

# Contact email
variable "team" {
  type = string
}

variable "purpose" {
  type = string
}

variable "auto_shutdown_bypass" {
  type = string
}

variable "alarm_name" {
  type = string
}