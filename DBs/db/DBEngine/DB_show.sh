#!/bin/bash

. ./colors.txt

while
	clear
	echo ""
	echo ""
	printf "${BGreen}"
	echo "		Existing Databases on the System"
	printf "${cf}"
	echo "		________________________________"
	echo ""
	echo ""
	echo ""


	dbList=( $(ls -l ./DBs | grep ^d | awk '{print $9}') )


	if [ ${#dbList[*]} -eq 0 ]; 
	then
		echo "	No Database has created yet"
	else
		printf "${BBlue}"
		printf "	%-10s" Databases
		printf "${cf}"
		printf "\n	============\n" 
		printf "${BRed}"
		for db in  ${dbList[*]}
		do
			printf "	%-10s" $db
			printf "\n"
		done
	fi
	

	echo ""
	echo ""
	printf "${BCyan}"
	echo ""
	echo "	Press any key to get back for the Main Menu"
	read
	. ./main.sh

do
	:
done











