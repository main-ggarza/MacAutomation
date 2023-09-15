#!/bin/bash

#################################################################################
# 
# This script will delete the username from the device. 
#
#################################################################################


# Define the username to search for and delete
username="corpit"

# Check if the username exists in the user list
if dscl . -list /Users | grep -q "^$username$"; then
    echo "User $username found."

    # Delete the user account
    sudo dscl . -delete "/Users/$username"
    echo "User account $username deleted."

    # Delete the user's home directory
    if sudo rm -rf "/Users/$username"; then
        echo "User home directory for $username deleted."
    else
        echo "Failed to delete user home directory for $username."
    fi

else
    echo "User $username not found."
fi
