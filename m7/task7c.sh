#!/usr/bin/bash
if [ $# -lt 3 ]
then
    echo "Script must have three parameter:  Path to the syncing  directory, path to the directory where the copies of the files will be stored, path to logfile "
		exit 1
else
echo "${1}, ${2}"
if [[ -d "${1}" ]]
then
    echo "Source directory found."
else
    echo "Source directory not found."
    echo "Script exited."
    exit 1
fi

if [[ -d "${2}" ]]
then
    echo "Destination directory found."
else
    echo "Destination directory not found, creating now."
    mkdir -p "${2}"
    if [ $? -eq 0 ]
    then
        echo "Successfully created destination directory."
    else
        echo "Failed to create destination directory. Script exited."
        exit 1
    fi
fi

#file and directory state before backup
#ls -lR "${1}" > "${2}/source_old"
ls -lR "${2}" > "${2}/dest_old"




#rsync -auv "${1}" "${2}" #for remote hosts
cp -auv "${1}" "${2}" 

#file and directory state after backup

#ls -lR "${1}" > "${2}/source_new"
ls -lR "${2}" > "${2}/dest_new"
diff "${2}/dest_old" "${2}/dest_new" >> "${3}"

fi



