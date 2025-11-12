###########################################
# Terraform Backend Configuration (S3)
###########################################

terraform {
  backend "s3" {
    bucket = "terraform-project1-state-pavithra"
    key    = "ec2-project/terraform.tfstate"
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
# Provider Configuration
###########################################
provider "aws" {
  region = "us-west-2"
}

###########################################
# EC2 Instance Creation (2 Instances)
###########################################
resource "aws_instance" "project1_ec2" {
  count         = 2
  ami           = "ami-063fd45469b67083e"   # Amazon Linux 2 (us-west-2)
  instance_type = "t3.micro"
  key_name      = "project_1"

  # Run installation script during instance initialization
  user_data = file("${path.module}/scripts/install_dev_tools.sh")

  tags = {
    Name      = "dev-tools-ec2-${count.index + 1}"
    Project   = "terraform-automation"
    ManagedBy = "Terraform"
  }
}
