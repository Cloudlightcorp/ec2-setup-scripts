#!/bin/bash
set -e

yum update -y

### Install Git
yum install -y git

### Install Python3
yum install -y python3

### Install Java (OpenJDK 11)
yum install -y java-11-openjdk

### Install .NET SDK
sudo rpm -Uvh https://packages.microsoft.com/config/centos/7/packages-microsoft-prod.rpm
sudo yum install dotnet-sdk-6.0 -y

### Install Node.js LTS
curl -sL https://rpm.nodesource.com/setup_18.x | bash -
yum install -y nodejs

### Install Jenkins
wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
yum install -y jenkins
systemctl enable jenkins
systemctl start jenkins
