#!/bin/bash

. ./colors.txt

isExist=0

while
	clear
	echo ""
	echo ""
	printf "${BWhite}"
	echo "		Create New Databae"
	echo "		__________________"
	echo ""
	echo ""
	echo ""
	printf "${BYellow}"
	echo -ne  "	CREATE DATABASE " 
	printf "${cf}" 
	read DBName 


	#check if database alread exist
	dbList=( $(ls -l ./DBs | grep ^d | awk '{print $9}') )

	for db in  ${dbList[*]}
	do	
		if [ "$DBName" = "$db" ]; 
		then
			echo ""
			echo ""
			printf "${BRed}" 
			echo "	Database with the same name already exist!.. ."
			((isExist++))
			sleep 0.5
			break
		fi
	done

	if [ "$isExist" -eq  0 ]; then
		mkdir ./DBs/$DBName
		echo ""
		printf "${BBlue}" 
		echo "	Database Created Succefully"
		sleep 0.5
	fi

	echo ""
	echo ""
	printf "${BCyan}"
	echo "	1) Main Menu! "
	echo "	2) Create Another Database"
	read -s opt

	case $opt in
		1)
			. ./main.sh
			break ;;
		2)
			. ./DB_create.sh
			break ;;
	esac
	printf "${cf}" 
do
	:
done
