# Project 2 - Terraform ALB Stack

This project provisions:
- VPC
- 2 public subnets, 2 private subnets
- Internet Gateway
- Route tables + associations
- Security groups for ALB and EC2
- 2 EC2 instances running a Flask app
- Application Load Balancer + target group + listener + attachments

## Quick Start (PowerShell)

```powershell
cd C:\Users\renef\OneDrive\Desktop\TERRAFORM_ASSIGNMENT4\project2-load-balancer
copy terraform.tfvars.example terraform.tfvars
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
```

## Important

- Do not hardcode credentials in Terraform files.
- Configure AWS credentials with `aws configure --profile default` or environment variables.
- Adjust `ssh_cidr` in `terraform.tfvars` to your public IP for safer SSH access.

## Outputs

After apply, Terraform prints:
- `alb_dns_name`
- `ec2_public_ips`
- `vpc_id`

## Cleanup

```powershell
terraform destroy
```
# TERRAFORM_ASSIGNMENT5
