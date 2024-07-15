
variable "ami_id" {
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

variable "key_pair_name" {
  type = string
}

variable "subnet_id" {
  type = list(string)
}

variable "security_group" {
  type = list(string)
}

variable "private_key_path" {
  type = string
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

variable "inline_user-data" {
  type = list(string)
}

variable "alarm_name" {
  type = string
}
