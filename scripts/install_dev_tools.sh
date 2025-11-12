#!/bin/bash
set -e

yum update -y

# Install Git & Python
yum install -y git python3

# Install Java 21 (Jenkins requirement)
amazon-linux-extras enable corretto21
yum install -y java-21-amazon-corretto

# Install Node.js 18 LTS
curl -fsSL https://rpm.nodesource.com/setup_18.x | bash -
yum install -y nodejs

# Install .NET SDK 6
rpm -Uvh https://packages.microsoft.com/config/centos/7/packages-microsoft-prod.rpm
yum install -y dotnet-sdk-6.0

# Install Jenkins (Latest stable)
wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
yum install -y jenkins
systemctl enable jenkins
systemctl start jenkins

# Version logs written for CodeBuild to fetch
echo "=== INSTALLED VERSIONS ===" > /opt/install_versions.txt
echo "Git: $(git --version)" >> /opt/install_versions.txt
echo "Python: $(python3 --version)" >> /opt/install_versions.txt
echo "Java: $(java -version 2>&1)" >> /opt/install_versions.txt
echo "Node: $(node -v)" >> /opt/install_versions.txt
echo "Dotnet: $(dotnet --version)" >> /opt/install_versions.txt
echo "Jenkins: $(rpm -q jenkins)" >> /opt/install_versions.txt
