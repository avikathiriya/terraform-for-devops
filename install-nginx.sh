#!/bin/bash

# Update packages
apt-get update -y

# Install Nginx
apt-get install -y nginx

# Start Nginx
systemctl start nginx

# Enable Nginx at boot
systemctl enable nginx

# Check status
systemctl status nginx --no-pager

echo "Nginx installation completed successfully!"