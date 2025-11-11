###########################################
# Provider Configuration
###########################################
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-west-2" # Oregon
}

###########################################
# EC2 Instance (using existing key pair)
###########################################
resource "aws_instance" "project1_ec2" {
  ami           = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 (us-west-2)
  instance_type = "t2.micro"
  key_name      = "project_1"              # existing key pair name

  tags = {
    Name = "project1-ec2"
  }
}
