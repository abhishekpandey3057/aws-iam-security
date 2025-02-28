resource "aws_security_group" "restricted_sg" {
  name        = "restricted-sg"
  description = "Restrict traffic to trusted IPs"

  dynamic "ingress" {
    for_each = [443, 22]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = var.trusted_ips
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
