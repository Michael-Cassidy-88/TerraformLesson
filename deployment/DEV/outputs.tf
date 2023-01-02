# --- deployment/DEV/instance/outputs.tf ---

output "vpc_id" {
  description = "ID of the vpc"
  value       = module.vpc.vpc_id
}