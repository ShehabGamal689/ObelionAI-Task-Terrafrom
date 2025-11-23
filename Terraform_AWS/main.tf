terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

# AMI lookup (Ubuntu 22.04 in us-east-1) 
data "aws_ami" "ubuntu_2204" {
  most_recent = true
  owners      = ["099720109477"] 

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

#  NETWORK MODULE
module "network" {
  source = "./modules/network"

  vpc_cidr             = var.vpc_cidr
  public_subnet_cidr   = var.public_subnet_cidr
  private_subnet1_cidr = var.private_subnet1_cidr
  private_subnet2_cidr = var.private_subnet2_cidr
}

#  SECURITY MODULE (SG) 
module "security" {
  source           = "./modules/security"
  vpc_id           = module.network.vpc_id
  ssh_allowed_cidr = var.ssh_allowed_cidr
}

#  COMPUTE MODULE (EC2)
module "compute" {
  source = "./modules/compute"

  ami_id        = data.aws_ami.ubuntu_2204.id
  instance_type = var.instance_type
  subnet_id     = module.network.public_subnet_id
  key_name      = var.key_name

  frontend_sg_id = module.security.frontend_sg_id
  backend_sg_id  = module.security.backend_sg_id
}

#  RDS MODULE (MySQL 8)
module "rds" {
  source = "./modules/rds"

  vpc_id     = module.network.vpc_id
  subnet_ids = module.network.private_subnet_ids
  db_sg_id   = module.security.db_sg_id

  db_name           = var.db_name
  db_username       = var.db_username
  db_password       = var.db_password
  instance_class    = var.db_instance_class
  allocated_storage = var.db_allocated_storage
}

# MONITORING MODULE (CPU alerts) 
module "monitoring" {
  source = "./modules/monitoring"

  frontend_instance_id = module.compute.frontend_instance_id
  backend_instance_id  = module.compute.backend_instance_id
  alert_email          = var.alert_email
}
