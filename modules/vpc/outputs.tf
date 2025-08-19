output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.this.id
}

output "internet_gateway_id" {
  description = "Internet Gateway ID"
  value       = aws_internet_gateway.this.id
}

output "default_security_group_id" {
  description = "Default security group ID"
  value       = aws_security_group.default.id
}

output "vpc_cidr_block" {
  description = "VPC CIDR block"
  value       = aws_vpc.this.cidr_block
}