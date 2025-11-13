#!/bin/bash
exec > /var/log/user_data.log 2>&1
set -e

echo "⏳ Waiting for yum..."
sleep 25
yum update -y

echo "Installing Git & Python"
yum install -y git python3

echo "Installing Java 11 (Corretto)"
amazon-linux-extras enable corretto11
yum install -y java-11-amazon-corretto

echo "Installing Node.js"
curl -fsSL https://rpm.nodesource.com/setup_18.x | bash -
yum install -y nodejs

echo "Installing .NET 6 SDK"
rpm -Uvh https://packages.microsoft.com/config/centos/7/packages-microsoft-prod.rpm
yum install -y dotnet-sdk-6.0

echo "Installing Jenkins"
wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
yum install -y jenkins

echo "Saving versions..."
{
  git --version
  python3 --version
  java -version
  node -v
  dotnet --version
  jenkins --version
} > /opt/install_versions.txt

echo "DONE"
