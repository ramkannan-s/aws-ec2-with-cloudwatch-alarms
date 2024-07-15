#AWS Region
region = "eu-north-1"

### instance
instance_count = "1"
ami_id         = "ami-07c8c1b18ca66bb07"
instance_type  = "t3.small"
key_pair_name  = "ramkannan_s"
volume_size    = "12"
alarm_name     = "mindtick_alarm"
inline_user-data = [
  "sudo apt-get update",
  "sudo apt update",
  "sudo apt install git -y",
  "sudo apt install apache2 -y",
  "echo \"<h1> Server Details Added</h1>\" > /var/www/html/index.html",
  "systemctl restart apache2",
  "echo 'Completed in VM......'"
]
ingress_cidr_ssh = ["52.215.237.185/32", "52.9.243.0/24", "52.215.237.0/24", "34.233.113.0/24", "13.127.185.0/24", "10.155.0.0/20", "10.155.8.0/22", "10.155.12.0/23", "10.155.14.0/23", "10.155.0.0/22", "10.155.4.0/23", "10.155.6.0/23"]

#VPC
vpc_cidr = "10.155.0.0/20"

private_subnet_cidrs = ["10.155.0.0/22", "10.155.4.0/23", "10.155.6.0/23"]

public_subnet_cidrs = ["10.155.8.0/22", "10.155.12.0/23", "10.155.14.0/23"]

# Tagging
vpc_name = "tech-demo-VPC-2024"

public_subnet_name_id = "tech-demo-Public-Subnet"

private_subnet_name_id = "tech-demo-Private-Subnet"

contact_email = "ramkannan2612@gmail.com"

contact_name = "RAMKANNAN S"

private_key_path = "ramkannan_s.pem"

name = ".compute.amazonaws.com"

team = "PS"

owner = "ramkannans"

purpose = "tech-demo-2024"

auto_shutdown_bypass = true
