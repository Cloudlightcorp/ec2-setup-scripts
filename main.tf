###########################################
# Terraform Backend Configuration (S3)
###########################################

terraform {
  backend "s3" {
    bucket = "terraform-project1-state-pavithra"   # <-- change to your bucket name
    key    = "ec2-project/terraform.tfstate"       # file name inside S3 bucket
    region = "us-west-2"                           # Oregon
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
# EC2 Instance (using existing key pair)
###########################################
resource "aws_instance" "project1_ec2" {
  ami           = "ami-063fd45469b67083e"  # Amazon Linux 2 AMI (Oregon)
  instance_type = "t3.micro"
  key_name      = "project_1"              # existing key pair name

  tags = {
    Name = "project1-ec2"
  }
}
