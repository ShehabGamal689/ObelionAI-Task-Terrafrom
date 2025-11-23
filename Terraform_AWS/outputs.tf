# Frontend Public IP
output "frontend_public_ip" {
  description = "Public IP of the frontend EC2 instance"
  value       = module.compute.frontend_public_ip
}

# Backend Public IP
output "backend_public_ip" {
  description = "Public IP of the backend EC2 instance"
  value       = module.compute.backend_public_ip
}


# RDS endpoint
output "rds_endpoint" {
  description = "Endpoint of the RDS MySQL instance"
  value       = module.rds.db_endpoint
}
