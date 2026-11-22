variable "ec2_instance_type" {
  default = "t3.micro"
  type    = string
}

variable "ec2_ami_id" {
  default = "ami-052190d76c25f66d1"
  type    = string
}

variable "ec2_default_root_storage_size" {
  default = 10
  type    = number
}

variable "env" {
  default = "prd"
  type    = string
}