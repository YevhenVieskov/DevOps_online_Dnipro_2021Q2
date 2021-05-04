#!/bin/bash
if ["$#" =="0"] 
then
    echo "Script must have two parameter:  Path to the syncing  directory and  path to the directory where the copies of the files will be stored "
	
		exit 1
else

fi

if [-d "${1}"]
then
    echo "Source directory found."
else 
    echo "Source directory not found."
    echo "Script exited."
    exit 1
fi

if [-d "${2}"]
then
    echo "Destination directory found."
else 
    echo "Destination directory not found, creating now."
    mkdir -p "${2}"
	if [$? -eq 0]
	then
	    echo "Successfully created destination directory."
	else
	    echo "Failed to create destination directory. Script exited."
		exit 1
		fi
fi

