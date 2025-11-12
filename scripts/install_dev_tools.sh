#!/bin/bash
exec > /var/log/user_data.log 2>&1
set -e

echo "⏳ Waiting for yum to be ready..."
sleep 20

yum update -y

echo "✅ Installing Git & Python"
yum install -y git python3

echo "✅ Installing Java 21"
amazon-linux-extras enable corretto21
yum install -y java-21-amazon-corretto

echo "✅ Installing Node.js"
curl -fsSL https://rpm.nodesource.com/setup_18.x | bash -
yum install -y nodejs

echo "✅ Installing .NET SDK 6"
rpm -Uvh https://packages.microsoft.com/config/centos/7/packages-microsoft-prod.rpm
yum install -y dotnet-sdk-6.0

echo "✅ Installing Jenkins"
wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
yum install -y jenkins
systemctl enable jenkins
systemctl start jenkins

echo "✅ Saving installed versions"
{
  echo "Git: $(git --version)"
  echo "Python: $(python3 --version)"
  echo "Java: $(java -version 2>&1)"
  echo "Node: $(node -v)"
  echo "Dotnet: $(dotnet --version)"
  echo "Jenkins: $(rpm -q jenkins)"
} > /opt/install_versions.txt

echo "✅ DONE — script finished successfully"
