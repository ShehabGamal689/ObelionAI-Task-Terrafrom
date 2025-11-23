variable "region" {
  type        = string
  default     = "us-east-1"
  description = "AWS region"
}

# VPC & subnets
variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  type    = string
  default = "10.0.1.0/24"
}

variable "private_subnet1_cidr" {
  type    = string
  default = "10.0.2.0/24"
}

variable "private_subnet2_cidr" {
  type    = string
  default = "10.0.3.0/24"
}

# EC2
variable "instance_type" {
  type    = string
  default = "t3.micro" # 2 vCPU, 1GiB RAM (close enough for test)
}

variable "key_name" {
  type        = string
  description = "Existing EC2 key pair name"
}

variable "ssh_allowed_cidr" {
  type        = string
  description = "CIDR allowed for SSH (e.g. 'x.x.x.x/32')"
}

# DB
variable "db_name" {
  type    = string
  default = "ecommerce"
}

variable "db_username" {
  type    = string
  default = "admin"
}

variable "db_password" {
  type      = string
  sensitive = true
}

variable "db_instance_class" {
  type    = string
  default = "db.t3.micro"
}

variable "db_allocated_storage" {
  type    = number
  default = 20
}

# Alerts
variable "alert_email" {
  type        = string
  description = "Email address to receive CPU alerts"
}
