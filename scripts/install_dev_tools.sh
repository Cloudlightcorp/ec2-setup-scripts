#!/bin/bash
exec > /var/log/user_data.log 2>&1
set -e

echo "⏳ Updating system..."
dnf update -y

echo "Installing Git & Python"
dnf install -y git python3

echo "Installing Java (Amazon Corretto 17)"
dnf install -y java-17-amazon-corretto-devel

echo "Installing Node.js 18"
dnf install -y nodejs-18*

echo "Installing .NET SDK 6"
dnf install -y dotnet-sdk-6.0

echo "Installing Jenkins"
wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
dnf install -y jenkins
