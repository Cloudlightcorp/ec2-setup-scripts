###########################################
# Terraform Backend Configuration (S3)
###########################################

terraform {
  backend "s3" {
    bucket = "automated-lab-ec2-instances"
    key    = "AutomatedLab-ec2-state-Linux/terraform.tfstate"
    region = "us-west-2"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

###########################################
# Provider
###########################################
provider "aws" {
  region = "us-west-2"
}

###########################################
# EC2 Instances (2) - Amazon Linux 2023
###########################################
resource "aws_instance" "linux_ec2" {
  count         = 2
  ami           = "ami-04f9aa2b7c7091927"   # Amazon Linux 2023
  instance_type = "t3.micro"
  key_name      = "Lab_env_Linux"

  user_data = file("${path.module}/scripts/install_dev_tools.sh")
  user_data_replace_on_change = true

  tags = {
    Name      = "lab-env-ec2-linux-${count.index + 1}"
    Project   = "terraform-automation"
    ManagedBy = "Terraform"
  }
}
