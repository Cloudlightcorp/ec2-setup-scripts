###########################################
  2 # Provider Configuration
  3 ###########################################
  4 terraform {
  5   required_providers {
  6     aws = {
  7       source  = "hashicorp/aws"
  8       version = "~> 5.0"
  9     }
 10   }
 11 }
 12 
 13 provider "aws" {
 14   region = "us-west-2" # Oregon
 15 }
 16 
 17 ###########################################
 18 # EC2 Instance (using existing key pair)
 19 ###########################################
 20 resource "aws_instance" "project1_ec2" {
 21   ami           = "ami-063fd45469b67083e" # Amazon Linux 2 (us-west-2)
 22   instance_type = "t3.micro"
 23   key_name      = "project_1"              # existing key pair name
 24 
 25   tags = {
 26     Name = "project1-ec2"
 27   }
 28 }
