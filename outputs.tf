output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

output "alb_dns_name" {
  description = "Public DNS name of the Application Load Balancer"
  value       = aws_lb.app.dns_name
}

output "ec2_public_ips" {
  description = "Public IP addresses of EC2 app instances"
  value       = aws_instance.app[*].public_ip
}

output "public_subnet_ids" {
  description = "Public subnet IDs"
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "Private subnet IDs"
  value       = aws_subnet.private[*].id
}

output "s3_bucket_name" {
  description = "Optional S3 bucket name (null when disabled)"
  value       = try(aws_s3_bucket.project[0].id, null)
}

output "s3_bucket_arn" {
  description = "Optional S3 bucket ARN (null when disabled)"
  value       = try(aws_s3_bucket.project[0].arn, null)
}
