#!/bin/bash

isExist=0

while 
	clear
	echo ""
	echo ""
	printf "${BWhite}"
	echo "		Use Existing Databae"
	echo ""
	echo ""
	printf "${BYellow}"
	echo -ne  "	USE DATABASE " 
	printf "${cf}" 
	read DBName 


	dbList=( $(ls -l ./DBs | grep ^d | awk '{print $9}') )

	for db in  ${dbList[*]}
	do
		if [ "$DBName" = "$db" ]; then
			clear
			echo ""
			echo ""
			printf "${BBlue}" 
			echo "	You are now using $DBName Database"
			((isExist++))
			. ./DB_menu.sh $DBName
			break
		fi
	done

	if [ "$isExist" -eq  0 ]; 
	then
		echo ""
		echo ""
		printf "${BRed}" 
		echo "	No Such database"
	fi

	echo ""
	echo ""
	printf "${BCyan}"
	echo "	1) Main Menu! "
	echo "	2) Try Again"
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
