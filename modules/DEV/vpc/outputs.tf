# --- modules/DEV/vpc/outputs.tf ---

output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.instance_vpc.id
}

output "subnet_id" {
  description = "ID of subnet"
  value       = aws_subnet.instance_subnet.id
}