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
# EC2 INSTANCE (DEFAULT SETTINGS)
###########################################
resource "aws_instance" "test_ec2" {
  ami           = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 (us-west-2)
  instance_type = "t2.micro"

  # Important: no key pair
  key_name = null

  tags = {
    Name = "cloudlightcorp-test-ec2"
  }
}
