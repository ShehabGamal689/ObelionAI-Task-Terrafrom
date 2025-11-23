
region = "us-east-1"

# Networking (VPC + subnets) 
vpc_cidr             = "10.0.0.0/16"
public_subnet_cidr   = "10.0.1.0/24"
private_subnet1_cidr = "10.0.2.0/24"
private_subnet2_cidr = "10.0.3.0/24"

# EC2 instances 
instance_type = "t3.micro"         

# The name of an EXISTING key pair in us-east-1
key_name = "shehab-ec2-access"

# User Public IP (for SSH)
ssh_allowed_cidr = "45.241.190.93/32"
# example: "102.45.67.89/32"

# Database (RDS MySQL 8) 
db_name              = "ecommerce"
db_username          = "admin"
db_password          = "StrongPass123"
db_instance_class    = "db.t3.micro"
db_allocated_storage = 20

# Monitoring alert
alert_email = "shehabgamal123456789@gmail.com"
