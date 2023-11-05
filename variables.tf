# Define a variable for dynamic ingress rules
variable "ingress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks  = list(string)
  }))
}

# Define a variable for dynamic egress rules
variable "egress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks  = list(string)
  }))
}


### VPC CIDR
variable "vpc_cidr" {
  type = string
  default = "20.0.0.0/16"
}

### Public Subnet CIDR
variable "public_subnet_cidr" {
  type = string
  default = "20.0.0.0/24"
}

variable "vpc_security_group_ids" {
  type = string
  default = "sg-0e3e2b7e7e0b3b2d1"
}

variable "public_subnet" {
  type = string
  default = "subnet-0e3e2b7e7e0b3b2d1"
}
