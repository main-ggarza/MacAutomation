#!/bin/bash

usr=$(whoami)

# Use AppleScript to prompt for input
customComputerName=$(osascript -e 'tell app "System Events" to display dialog "Enter Computer Name:" default answer "Add the desired computer Name" buttons {"OK"} default button 1' \
    -e 'text returned of result')



if [ -n "$customComputerName" ]; then
    # Set the computer name, local hostname, and hostname to the custom name
    sudo scutil --set ComputerName "$customComputerName"
    sudo scutil --set LocalHostName "$customComputerName"
    sudo scutil --set HostName "$customComputerName"

    # Clear the directory service cache
   # dscacheutil -flushcache

    # Run a command to send the new computer name to Jamf Pro for inventory
    # Replace this with the appropriate command for your setup
    #sudo jamf recon
    
    # Display a message to the user
    osascript -e 'display dialog "Your computer name has been changed to: '"$customComputerName"'" buttons {"OK"} default button 1'

else
    # Display an error message if the user canceled
    osascript -e 'display dialog "Operation canceled. No changes were made." buttons {"OK"} default button 1'

fi
