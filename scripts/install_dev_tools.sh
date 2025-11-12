#!/bin/bash
# Log everything
exec > /var/log/dev-tools-install.log 2>&1

echo "Updating system..."
yum update -y

##################################
# Install Development Tools
##################################

echo "Installing Git..."
yum install git -y

echo "Installing Python3 and pip..."
yum install python3 -y

echo "Installing Java (OpenJDK 11)..."
amazon-linux-extras install java-openjdk11 -y

echo "Installing Node.js & npm..."
curl -fsSL https://rpm.nodesource.com/setup_18.x | bash -
yum install -y nodejs

echo "Installing .NET SDK..."
rpm -Uvh https://packages.microsoft.com/config/centos/7/packages-microsoft-prod.rpm
yum install dotnet-sdk-6.0 -y

##################################
# Install Jenkins (do NOT start)
##################################
echo "Installing Jenkins repo..."
wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo

rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

echo "Installing Jenkins (without starting service)..."
yum install jenkins -y

echo "✅ Installation completed. Log stored at: /var/log/dev-tools-install.log"
