#!/bin/bash
yum update -y

# === Install Git ===
yum install -y git

# === Install Python 3.9 ===
amazon-linux-extras enable python3.9
yum install -y python3.9

# === Install Java 11 (OpenJDK) ===
amazon-linux-extras install java-openjdk11 -y

# === Install Node.js 18 ===
curl -sL https://rpm.nodesource.com/setup_18.x | bash -
yum install -y nodejs

# === Install .NET SDK 6 ===
rpm -Uvh https://packages.microsoft.com/config/centos/7/packages-microsoft-prod.rpm
yum install -y dotnet-sdk-6.0

# === Install Jenkins ===
wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
yum install -y jenkins
systemctl enable jenkins
systemctl start jenkins

# === Save version outputs to verify in CodeBuild ===
echo "=== SOFTWARE INSTALLED VERSIONS ===" > /opt/install_versions.txt
echo "Git: $(git --version)"               >> /opt/install_versions.txt
echo "Python: $(python3 --version)"        >> /opt/install_versions.txt
echo "Java: $(java -version 2>&1)"         >> /opt/install_versions.txt
echo "Node.js: $(node -v)"                 >> /opt/install_versions.txt
echo ".NET SDK: $(dotnet --version)"       >> /opt/install_versions.txt
echo "Jenkins: $(rpm -q jenkins)"          >> /opt/install_versions.txt
