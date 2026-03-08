variable "aws_region" {
  description = "AWS region for all resources"
  type        = string
  default     = "eu-west-2"
}

variable "environment" {
  description = "Environment tag value"
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be one of: dev, staging, prod."
  }
}

variable "project_name" {
  description = "Project name prefix for resource naming"
  type        = string
  default     = "lb-project"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "Two CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "Two CIDR blocks for private subnets"
  type        = list(string)
  default     = ["10.0.11.0/24", "10.0.12.0/24"]
}

variable "instance_type" {
  description = "EC2 instance type for app servers"
  type        = string
  default     = "t3.micro"
}

variable "ssh_cidr" {
  description = "CIDR block allowed to SSH to EC2 instances"
  type        = string
  default     = "0.0.0.0/0"
}

variable "app_port" {
  description = "Flask app listening port"
  type        = number
  default     = 5000
}

variable "create_s3_bucket" {
  description = "Whether to create an optional S3 bucket for the project"
  type        = bool
  default     = false
}

variable "s3_bucket_name" {
  description = "Globally unique S3 bucket name (required when create_s3_bucket=true)"
  type        = string
  default     = ""

  validation {
    condition     = var.create_s3_bucket == false || length(trim(var.s3_bucket_name)) > 0
    error_message = "Set s3_bucket_name when create_s3_bucket is true."
  }
}
