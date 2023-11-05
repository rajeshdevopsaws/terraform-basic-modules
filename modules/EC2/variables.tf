variable "vpc_security_group_ids" {
  type = string
  default = "sg-0e3e2b7e7e0b3b2d1"
}

variable "public_subnet" {
  type = string
  default = "subnet-0e3e2b7e7e0b3b2d1"
}

variable "aws_ec2_ami" {
  type = string
  default = "ami-03d5c68bab01f3496"
}

variable "aws_ec2_instance_type" {
  type = string
  default = "t2.micro"
}
  