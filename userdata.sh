#!/bin/bash

# Update the package list and install Nginx
echo "Updating package list and installing Nginx..."
apt-get update
apt-get install -y nginx

# Start Nginx and enable it to run on system boot
echo "Starting Nginx and enabling it to start on boot..."
systemctl start nginx
systemctl enable nginx

# Check Nginx status
if systemctl is-active --quiet nginx; then
    echo "Nginx has been successfully installed and started."
else
    echo "Nginx installation failed. Please check for errors."
fi
