#!/bin/bash

LstBackupDate=$(ls ~ | grep -E "^Backup-" | sort -n | tail -1 | sed "s/Backup-//")
LstBackup="~/Backup-${LstBackupDate}"
Today=$(date +"%Y-%m-%d")
CurrentSec=$(date -d "$Today" +"%s")
LstBackupSec=$(date -d "$LstBackupDate" +"%s")
DaysDelta=$(echo "(${CurrentSec} - ${LstBackupSec}) / 60 / 60 / 24" | bc)
rep=~/.backup-report

if [[ $DaysDelta > 7 || -z "$LstBackupDate" ]];
then
	mkdir "~/Backup-${Today}"
	for file in $(ls ~/source);
    do
	    cp "~/source/$file" "~/Backup-$Today"
    done
	flist=$(ls ~/source | sed "s/^/\t/")
	echo -e "${Today}. Created:\n${flist}" >> $rep
else
	changes=""
	for file in $(ls ~/source);
    do
		if [[ -f "$LstBackup/$file" ]];
        then
			SourceSize=$(wc -c "~/source/${file}" | awk '{print $1}')
			BackupSize=$(wc -c "${LstBackup}/${file}" | awk '{print $1}')
			TotalSize=$(echo "${SourceSize} - ${BackupSize}" | bc)
			if [[ $TotalSize != 0 ]];
            then
				mv "$LstBackup/$file" "$LstBackup/$file.$Today"
				cp "~/source/$file" $LstBackup
				changes="${changes}\n\t$file ($file.$Today)"
			fi
		else
			cp "~/source/$file" $LstBackup
			changes="${changes}\n\t$file"
        fi
	done
    changes=$(echo $changes | sed 's/^\\n//')
    if [[ ! -z "$changes" ]];
    then
	    echo -e "${LstBackupDate}. Updated:\n${changes}" >> $rep
	fi
fi