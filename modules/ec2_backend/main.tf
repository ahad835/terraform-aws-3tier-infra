resource "aws_security_group" "backend_sg" {
  name        = "backend-sg"
  description = "Allow all traffic from frontend SG"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    security_groups = [var.source_sg_id]
    description     = "Allow ALL from frontend"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "backend-sg"
  }
}

resource "aws_instance" "backend" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  associate_public_ip_address = false
  vpc_security_group_ids = [aws_security_group.backend_sg.id]
  key_name               = var.key_name
  user_data              = file("${path.module}/user_data.sh")

  tags = {
    Name = "backend-ec2"
  }
}
