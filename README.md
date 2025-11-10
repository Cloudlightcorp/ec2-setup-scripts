# EC2 Terraform Deployment — cloudlightcorp

This repository contains a minimal Terraform configuration to launch an **Amazon Linux EC2 instance** in AWS.

## 🚀 Purpose

To test basic infrastructure provisioning using Terraform with default AWS settings.

## ✅ What This Terraform Script Does

- Uses AWS region **us-west-2 (Oregon)**
- Launches **Amazon Linux 2** EC2 instance (`t2.micro`)
- Uses **default VPC, subnets, security groups, storage**
- **No key pair assigned** (instance is not SSH accessible — testing only)
- Clean and minimal configuration

## 📂 Files

| File Name | Description |
|----------|-------------|
| `main.tf` | Terraform script to launch EC2 instance |

---

## ⚙️ Prerequisites

Before running Terraform:

1. AWS CLI configured (`aws configure`)
2. Terraform installed (`terraform -v`)
3. Valid AWS IAM user with EC2 permissions

---

## ▶️ How to Run

```sh
terraform init
terraform validate
terraform apply
