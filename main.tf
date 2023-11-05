module "ec2-module" {
  source = "./modules/EC2"

  # You can define your own values for the variables below
  vpc_security_group_ids = module.sg.sg_id
  public_subnet = module.vpc-module.public_subnet_ids
}

module "vpc-module" {
  source = "./modules/VPC"

  # You can define your own values for the variables below
  # vpc_cidr = var.vpc_cidr
  # public_subnet_cidr = var.public_subnet_cidr
}

module "sg" {
  source = "./modules/sg"

  # You can define your own values for the variables below
  vpc_id = module.vpc-module.vpc_id
  ingress_rules = var.ingress_rules
  egress_rules = var.egress_rules
}