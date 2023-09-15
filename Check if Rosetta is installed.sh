#!/bin/bash

#################################################################################
# 
# This script will check if Rosetta is installed. 
#
#################################################################################

rosettaTest=$(arch -x86_64 /usr/bin/true 2> /dev/null ; echo $? )
if [[ "${rosettaTest}" -eq 0 ]]; then
    echo "<result>Installed</result>"               #If Rosetta is installed it will display the message "Installed"
else
    echo "<result>Non-Installed</result>"           #If Rosetta is not installed it will display the message "Non-Installed"
fi