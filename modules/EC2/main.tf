
# creating a resource of type aws_instance
resource "aws_instance" "app_server" {
    ami             = var.aws_ec2_ami
    instance_type = var.aws_ec2_ami
    vpc_security_group_ids = [var.vpc_security_group_ids]
    subnet_id = var.public_subnet
    user_data = file("userdata.sh")
    tags = {
      module = "ec2-module-instance"
    }
}