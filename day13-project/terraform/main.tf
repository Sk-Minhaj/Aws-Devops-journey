terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.73.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "ap-southeast-2"
}
resource "aws_instance" "temp-ec2" {
  #count                  = 2
  ami                    = var.ec2_ami_id
  instance_type          = var.ec2_instance_type
  vpc_security_group_ids = [aws_security_group.day12_sg.id]
  key_name               = "devops-key"
  # user_data              = file("install_nginx.sh")
  root_block_device {
    volume_size = var.env == "prd" ? 20 : var.ec2_default_root_storage_size
    volume_type = "gp3"
  }

  tags = {
    Name = "day12-ec2"
  }
}