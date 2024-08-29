variable "ami_id" {}
variable "instance_type" {}
variable "tag_name" {}
variable "public_key" {}
variable "subnet_id" {}
variable "sg_enable_ssh_https" {}
variable "enable_public_ip_address" {}
variable "user_data_template" {}
variable "ec2_sg_name_for_node_api" {}
variable "lb_target_group_arn" {}
variable "public_subnets" {}

output "ssh_connection_string_for_ec2" {
  value = format("%s%s", "ssh -i /home/ubuntu/.ssh/id_rsa ubuntu@", aws_instance.ec2_instance.public_ip)
}

output "ec2_instance_id" {
  value = aws_instance.ec2_instance.id
}

resource "aws_instance" "ec2_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  tags = {
    Name = var.tag_name
  }
  key_name                    = "id_rsa_ec2"
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.sg_enable_ssh_https, var.ec2_sg_name_for_node_api]
  associate_public_ip_address = var.enable_public_ip_address

  user_data = templatefile(var.user_data_template, {})

  metadata_options {
    http_endpoint = "enabled"  # Enable the IMDSv2 endpoint
    http_tokens   = "required" # Require the use of IMDSv2 tokens
  }
}

# #3. Launch Template for EC2 Instances
resource "aws_launch_template" "ec2_launch_template" {
  name = "ec2-launch-template"

  image_id      = var.ami_id
  instance_type = var.instance_type

  network_interfaces {
    associate_public_ip_address = true
    security_groups             =  [var.sg_enable_ssh_https, var.ec2_sg_name_for_node_api]
  }

  user_data = filebase64(var.user_data_template)

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "ec2-launch-template"
    }
  }
}

# Auto Scaling Group
resource "aws_autoscaling_group" "ec2_asg" {
  name                = "dev-asg"
  desired_capacity    = 2
  min_size            = 1
  max_size            = 3
  target_group_arns   = [var.lb_target_group_arn]
  vpc_zone_identifier = var.public_subnets

  launch_template {
    id      = aws_launch_template.ec2_launch_template.id
    version = "$Latest"
  }

  health_check_type = "EC2"
}

resource "aws_key_pair" "ec_key_pair" {
  key_name   = "id_rsa_ec2"
  public_key = var.public_key
}