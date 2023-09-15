#!/bin/bash

# Define an array of our baseline applications. The only app missing is ManageEngine. 
applications=("globalProtect.app" "falcon.app" "slack.app" "Microsoft Outlook.app" "Microsoft Excel.app" "Microsoft Word.app" "Microsoft PowerPoint.app" "Microsoft OneNote.app" "OneDrive.app" "zoom.us.app" "google Chrome.app")

# Function to check if an application is installed. The application needs to be in /Applications in order for this to work. 
function is_app_installed() {
    local app_name="$1"
    if [ -e "/Applications/$app_name" ]; then
        return 0  # Application is installed
    else
        return 1  # Application is not installed
    fi
}

# Initialize a variable to track compliance
compliant=true

# Loop through the applications and check if they are installed
for app in "${applications[@]}"; do
    if ! is_app_installed "$app"; then
        compliant=false
        break  # Exit the loop as soon as one non-compliant app is found
    fi
done

# Check if all applications are installed and set the result accordingly
if $compliant; then
    echo "<result>Compliant</result>" # This result will be reflected in the EA. This will be display in EA.
else
    echo "<result>Non-Compliant</result>" # This result will be reflected in the EA. This will be display in EA. 
fi