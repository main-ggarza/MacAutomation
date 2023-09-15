#!/bin/sh

#Rename the Mac using the first and last initial of the user's name.

#Who is the current logged in user?
currentUser=`/bin/ls -l /dev/console | /usr/bin/awk '{ print $3 }'`
echo $currentUser

#Generate computer name - 
firstInitial=$(finger -s $currentUser | head -2 | tail -n 1 | awk '{print toupper ($2)}' | cut -c 1)
lastInitial=$(finger -s $currentUser | head -2 | tail -n 1 | awk '{print toupper ($3)}' | cut -c 1)
currentDate=$(date +%Y%m%d)

computerName=$"L$firstInitial$lastInitial$currentDate"

echo $computerName

#Send the computer name to inventory record
scutil --set ComputerName $computerName
scutil --set LocalHostName $computerName
scutil --set HostName $computerName

#Clear the directory service cache then run a current inventory to send the new Mac name to Jamf Pro
dscacheutil -flushcache
/usr/local/jamf/bin/jamf recon