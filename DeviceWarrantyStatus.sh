#!/bin/bash

# This EA will grab the current logged in user and find the Warranty plist
# This is useful to grab the coverageEndDate key from the plist and provide 
# a date in which warranty coverage should be ending
#
#
# Get the current logged in user
loggedInUser=$( echo "show State:/Users/ConsoleUser" | scutil | awk '/Name / { print $3 }' )
# Find the coverage end date key in Warranty.plist
coverageEndDate=$( /usr/bin/defaults read /Users/$loggedInUser/Library/Application\ Support/com.apple.NewDeviceOutreach/Warranty.plist coverageEndDate )
# Format the EPOCH time to something readable
formattedTime=$(date -jf %s $coverageEndDate "+%F %T")

echo "<result>$formattedTime</result>"
