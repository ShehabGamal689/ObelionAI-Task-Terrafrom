# Frontend EC2
resource "aws_instance" "frontend" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.frontend_sg_id]
  associate_public_ip_address = true
  key_name                    = var.key_name

  root_block_device {
    volume_size = 8
    volume_type = "gp3"
  }

  tags = {
    Name = "frontend-ubuntu-2204"
    Role = "frontend"
  }
}

# Backend EC2
resource "aws_instance" "backend" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.backend_sg_id]
  associate_public_ip_address = true
  key_name                    = var.key_name

  root_block_device {
    volume_size = 8
    volume_type = "gp3"
  }

  tags = {
    Name = "backend-ubuntu-2204"
    Role = "backend"
  }
}
