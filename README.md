# Terraform AWS Infrastructure

Modular Terraform configuration for AWS infrastructure deployment.

## 📁 Project Structure

Terraform_AWS/
├── main.tf # Root module - ties everything together
├── variables.tf # Input variables
├── outputs.tf # Output values
├── terraform.tfvars # Variable values (create from example)
├── terraform.tfvars.example # Example variables file
├── providers.tf # Provider configuration
│
├── modules/ # Reusable modules
│ ├── network/ # VPC, subnets, routing
│ │ ├── main.tf
│ │ ├── variables.tf
│ │ └── outputs.tf
│ ├── compute/ # EC2 instances, auto scaling
│ │ ├── main.tf
│ │ ├── variables.tf
│ │ └── outputs.tf
│ ├── security/ # Security groups, IAM roles
│ │ ├── main.tf
│ │ ├── variables.tf
│ │ └── outputs.tf
│ ├── rds/ # Database instances
│ │ ├── main.tf
│ │ ├── variables.tf
│ │ └── outputs.tf
│ └── monitoring/ # CloudWatch, alerts
│ ├── main.tf
│ ├── variables.tf
│ └── outputs.tf
└── README.md


## 🚀 Quick Start

### Prerequisites
```
# Install Terraform
# Install AWS CLI and configure credentials
aws configure
```
Setup
```
git clone <repository-url>
cd Terraform_AWS

# Copy and edit variables
cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars with your values
```
Deployment
```
# Initialize
terraform init

# Plan deployment
terraform plan

# Apply configuration
terraform apply
```
⚙️ Configuration

```
# Required Variables
project_name = "my-project"
environment  = "dev"
aws_region   = "us-east-1"

# Network
vpc_cidr     = "10.0.0.0/16"

# Compute
instance_type = "t3.micro"
key_name      = "my-keypair"

# Database
db_instance_class = "db.t3.micro"
db_name          = "mydatabase"
```

🏗️ Modules
Network Module
VPC with public/private subnets

Internet Gateway

NAT Gateway

Route tables

Compute Module
EC2 instances

Auto Scaling groups

Load balancers

Security Module
Security groups

IAM roles and policies

Key pairs

RDS Module
PostgreSQL/MySQL databases

Parameter groups

Subnet groups

Monitoring Module
CloudWatch alarms

SNS topics

Dashboards

📊 Outputs
After deployment, you'll get:

VPC ID and subnet IDs

EC2 instance public IPs

RDS endpoint

Load balancer DNS

```
Note: Review and customize terraform.tfvars before deployment.
```
