#!/bin/bash

# This script will use Jamf Binary to create an admin hidden account 
sudo jamf createAccount -username testadmin -realname Test Admin -password Changeyourpassword1! -admin -hiddenUser

# Running a update of the device after creating the account. 
sudo jamf recon

# Deploy pening policies that the device or user has assinged to it
sudo jamf policy update
