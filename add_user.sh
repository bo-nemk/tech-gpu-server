#!/bin/bash

# Check if the script is being run as root
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root." >&2
    exit 1
fi

# Ask for the new username
read -p "Enter the username of the new user: " username

# Add the new user (without a password)
adduser --disabled-password --gecos "" "$username"
passwd "$username"

# Check if the user was added successfully
if [ $? -ne 0 ]; then
    echo "Failed to add user $username." >&2
    exit 1
fi

# Copy the install_user.sh script to the new user's home directory
cp install_user.sh /home/"$username"/
chown "$username":"$username" /home/"$username"/install_user.sh

# Set the execute permission on the script
chmod u+x /home/"$username"/install_user.sh
