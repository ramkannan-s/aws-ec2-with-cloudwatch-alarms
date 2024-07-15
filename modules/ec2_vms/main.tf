data "aws_ami" "ubuntu" {

    most_recent = true

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }

    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }

    owners = ["099720109477"]
}

resource "aws_instance" "ec2_vms" {
  count                  = var.instance_count
  ami                    = data.aws_ami.ubuntu.id
  #ami                    = var.ami_id
  #ami = "ami-07c8c1b18ca66bb07"
  instance_type          = var.instance_type
  key_name               = var.key_pair_name
  subnet_id              = element(var.subnet_id, count.index)
  vpc_security_group_ids = var.security_group
  #vpc_security_group_ids = [aws_security_group.main.id]
  root_block_device {
    volume_size           = var.volume_size
    volume_type           = "gp2"
    delete_on_termination = true
  }

  tags = {
    Name = "ec2-techdemo${count.index + 1}${var.name}"
    team    = var.team
    owner   = var.owner
    purpose = var.purpose
    auto_shutdown_bypass = var.auto_shutdown_bypass
  }
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file(var.private_key_path)
    host        = self.public_dns
    timeout     = "10m"
  }
  provisioner "remote-exec" {
    inline = var.inline_user-data
  }
}

resource "aws_eip" "TechDemoElasticIP" {
  instance = aws_instance.ec2_vms[count.index].id
  count = var.instance_count
}

resource "aws_cloudwatch_metric_alarm" "high_cpu_alarm" {
  count               = length(aws_instance.ec2_vms)
  alarm_name          = "${var.alarm_name}-high-cpu"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 60
  statistic           = "Average"
  threshold           = 40

  alarm_description = "This alarm fires when CPU utilization exceeds 40%"
  alarm_actions     = [aws_sns_topic.alerts.arn]

  dimensions = {
    InstanceId = aws_instance.ec2_vms[count.index].id
  }

  tags = {
    Service = var.alarm_name
  }
}

resource "aws_cloudwatch_metric_alarm" "high_memory_alarm" {
  count               = length(aws_instance.ec2_vms)
  alarm_name          = "${var.alarm_name}-high-memory"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "MemoryUtilization"
  namespace           = "AWS/EC2"
  period              = 60
  statistic           = "Average"
  threshold           = 45

  alarm_description = "This alarm fires when Memory utilization exceeds 45%"
  alarm_actions     = [aws_sns_topic.alerts.arn]

  dimensions = {
    InstanceId = aws_instance.ec2_vms[count.index].id
  }
  tags = {
    Service = var.alarm_name
  }
}

resource "aws_sns_topic" "alerts" {
  name = "example-sns-topic"
}

resource "aws_sns_topic_subscription" "alert_subscription" {
  topic_arn = aws_sns_topic.alerts.arn
  protocol  = "email"
  endpoint  = "ramkannan2612@gmail.com"
}