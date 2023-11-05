# creating security group
resource "aws_security_group" "allow_tls" {
  name        = "my-module-sg"
  description = "Allow TLS inbound traffic"
  vpc_id = var.vpc_id
  # Ingress rules based on the "ingress_rules" variable
  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  # Egress rules based on the "egress_rules" variable
  dynamic "egress" {
    for_each = var.egress_rules
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }
}
