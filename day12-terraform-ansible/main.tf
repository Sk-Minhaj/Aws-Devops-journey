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
  region= "ap-southeast-2"
}
resource "aws_instance" "temp-ec2"{
    ami= "ami-052190d76c25f66d1"
    instance_type= "t3.micro"

    vpc_security_group_ids = [aws_security_group.day12_sg.id]
    key_name = "devops-key"

    tags={
        Name= "day12-ec2"
    }
}