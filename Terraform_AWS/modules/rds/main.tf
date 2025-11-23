resource "aws_db_subnet_group" "this" {
  name       = "ecommerce-db-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "ecommerce-db-subnet-group"
  }
}

resource "aws_db_instance" "this" {
  identifier        = "ecommerce-mysql"
  engine            = "mysql"
  engine_version    = "8.0"
  instance_class    = var.instance_class
  allocated_storage = var.allocated_storage

  db_name  = var.db_name
  username = var.db_username
  password = var.db_password

  db_subnet_group_name   = aws_db_subnet_group.this.name
  vpc_security_group_ids = [var.db_sg_id]

  publicly_accessible = false
  skip_final_snapshot = true
  deletion_protection = false

  backup_retention_period = 1

  tags = {
    Name = "ecommerce-mysql"
  }
}
