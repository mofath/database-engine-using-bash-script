#!/bin/bash

. ./colors.txt
DBName=$1

while
	clear
	echo ""
	echo ""
	printf "${BWhite}"
	echo "		$DBName Database Tables"
	echo ""
	echo ""
	printf "${BYellow}"

	#Using ls -p tells ls to append a slash to entries which are a directory
	#using grep -v / tells grep to return only lines not containing a slash
	tblList=( $(ls -p ./DBs/$DBName | grep -v /) )

	if [ ${#tblList[*]} -eq 0 ]; 
	then
		echo "	Database has no tables"
	else
		printf "	%-10s" Tables
		printf "${cf}"
		printf "\n	============\n" 
		printf "${BRed}"
		for tbl in  ${tblList[*]}
		do
			printf "	%-10s" $tbl
			printf "\n"
		done
	fi


	echo ""
	echo ""
	echo ""
	printf "${BCyan}"
	echo "	1) $DBName Menu"
	echo "	2) Main Menu! "

	read -s opt

	case $opt in
		1)
			. ./DB_menu.sh $DBName
			break ;;
		2)
			. ./main.sh
			break ;;
	esac

do
	:
done
