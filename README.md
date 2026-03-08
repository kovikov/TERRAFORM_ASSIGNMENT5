# Project 2 - Terraform ALB Stack

This project provisions:
- VPC
- 2 public subnets, 2 private subnets
- Internet Gateway
- Route tables + associations
- Security groups for ALB and EC2
- 2 EC2 instances running a Flask app
- Application Load Balancer + target group + listener + attachments
- Optional S3 bucket (disabled by default)

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
- `s3_bucket_name` (null if disabled)
- `s3_bucket_arn` (null if disabled)

## Optional S3 Bucket

Enable in `terraform.tfvars`:

```hcl
create_s3_bucket = true
s3_bucket_name   = "your-globally-unique-bucket-name"
```

## Cleanup

```powershell
terraform destroy
```

## CI/CD (GitHub Actions)

This repo includes a workflow at `.github/workflows/terraform-cicd.yml`.

### CI

- Runs on pull requests and pushes to `main`
- Executes:
	- `terraform fmt -check -recursive`
	- `terraform init -backend=false`
	- `terraform validate`

### CD (Manual)

- Trigger from GitHub: `Actions` -> `Terraform CI/CD` -> `Run workflow`
- Choose action:
	- `plan`
	- `apply`
	- `destroy`

### Required GitHub Secrets

Set both access-key secrets:

- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`

### Optional Inputs

- `aws_region` (default: `eu-west-2`)
- `var_file` (default: `terraform.tfvars`)
