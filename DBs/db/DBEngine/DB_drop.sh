#!/bin/bash

. ./colors.txt

isExist=0

while 
	clear
	echo ""
	echo ""
	printf "${BBlue}"
	echo "		DROP DATABASE"
	echo ""
	echo ""
	printf "${BYellow}"
	echo -ne "	DROP "
	printf "${cf}"
	read DBName

	dbList=( $(ls -l ./DBs | grep ^d | awk '{print $9}') )

	for db in  ${dbList[*]}
	do
		if [ "$DBName" = "$db" ]; then
			clear
			rm -rf ./DBs/$DBName
			echo ""
			echo ""
			printf "${BGreen}"
			echo "	Database deleted successfuly..."
			echo ""
			((isExist++))
			break
		fi
	done

	if [ "$isExist" -eq  0 ]; then
		echo ""
		echo ""
		printf "${BRed}"
		echo "	No Such Database"
	fi

	
	echo ""
	echo ""
	printf "${BCyan}"
	echo "	Press any key to get back for the Main Menu"
	read
	. ./main.sh

do
	:
done
