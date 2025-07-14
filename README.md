# 🚀 Terraform AWS 3-Tier Infrastructure Boilerplate

A production-ready **modular 3-tier infrastructure** on AWS built entirely using **Terraform**.  
This repo is designed for:
- Developers / DevOps Engineers
- Freelancers
- Cloud Learners
- Tech Leads preparing for AWS/DevOps interviews

With just a few commands, you can spin up:
✅ A secure VPC  
✅ Public + private subnets  
✅ EC2 frontend & backend tier  
✅ PostgreSQL RDS  
✅ Remote backend on S3 with DynamoDB locking

---

## 📦 What’s Included

| Layer         | Components                                                                 |
|---------------|----------------------------------------------------------------------------|
| **Networking**| VPC, 4 subnets (2 public, 2 private), NAT Gateway, Internet Gateway        |
| **Compute**   | Frontend EC2 (NGINX, SSH), Backend EC2 (private access only)               |
| **Database**  | PostgreSQL RDS in private subnet, secured via SG                           |
| **Security**  | SG → SG communication, locked-down ingress rules, SSH from your IP only    |
| **State**     | Remote Terraform state via S3 + DynamoDB locking                           |

---

## 🧠 Why Should You Clone This?

- ✅ **Ready-to-use** Terraform modules for real-world infra
- ✅ Clean separation of `envs/dev` and reusable `modules/`
- ✅ Used in **freelance gigs**, **interview prep**, and **client POCs**
- ✅ Helps you learn & showcase:
  - Remote state with locking
  - Private networking with NAT
  - Secure app-to-app access via SG
  - Modular infrastructure patterns
- ✅ Perfect as a boilerplate to scale with ASG, ALB, EFS, etc.

---

## 🧱 Directory Structure

```bash
terraform-aws-3tier-infra/
├── envs/
│   └── dev/                     # Environment-specific configs
│       ├── main.tf
│       ├── backend.tf
│       ├── backend.config.tfvars
│       ├── dev.tfvars
│       ├── example.dev.tfvars
│       └── variables.tf
├── modules/
│   ├── vpc/
│   ├── ec2_frontend/
│   ├── ec2_backend/
│   └── rds_postgres/
├── images/
│   └── aws-3tier-architecture.png
├── .gitignore
└── README.md


## How to Use This Project
Here’s how you or anyone cloning this repo can get it running in minutes:


## step 1: Clone the repo
git clone https://github.com/<your-username>/terraform-aws-3tier-infra.git
cd terraform-aws-3tier-infra/envs/dev


## Step 2 : CREATE BUCKET on AWS and Dynamo DB TABLE For state file for Lock

REPLACE bucket         = "your-bukcet-name" in file : terraform-aws-3tier-infra/envs/dev/backend.config.tfvars

Create a dynamodb table on aws with name : terraform-locks


## Step 3: Update the Terraform Variables
🧾 Copy the example file

cp example.dev.tfvars dev.tfvars

Edit dev.tfvars and provide your inputs

## ✅ Step 4: Initialize Terraform with Remote Backend

terraform init -reconfigure \
  -backend-config=backend.config.tfvars


✅ Step 5: Deploy the Infrastructure

terraform plan -var-file=dev.tfvars

Apply:

terraform apply -var-file=dev.tfvars


## You’ll get a complete 3-tier AWS architecture running in minutes.


Security Highlights
✅ Backend EC2 lives in private subnet (no public IP)
✅ Frontend EC2 only exposes ports 22 and 443
✅ Backend allows only SG access from Frontend
✅ RDS allows port 5432 from Backend SG only
✅ SSH is limited to your IP address (not 0.0.0.0/0)  --> Add IP in dev.tfvars for SSH 
✅ Terraform state is versioned, locked and encrypted remotely
