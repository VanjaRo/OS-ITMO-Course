#!/bin/bash

backupName=$(ls ~ | grep -oE "Backup-[0-9]{4}-[0-9]{2}-[0-9]{2}" | tail -n1)

if [[ "$backupName" == "" ]] ;
then
    echo "Backup not found."
    exit 1
fi

if [[ ! -d ~/restore ]];
then
	mkdir ~/restore
fi

for file in $(find "~/$backupName/" -type f | grep -Ev '.[0-9]{4}-[0-9]{2}-[0-9]{2}$')
do 
    cp "$file" "~/restore"
    echo "Done!"
done
echo "Upback completed."