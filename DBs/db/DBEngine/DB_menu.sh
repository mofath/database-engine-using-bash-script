#!/bin/bash

DBName=$1
. ./colors.txt

while 
	clear
	echo ""
	echo ""
	printf "${BCyan}"
	echo "			You are Now Using $DBName"
	echo "			______________________"
	echo ""
	echo ""
	echo ""
	printf "${BBlue}"
	echo "	 Select Operation"
	printf "${cf}"
	echo "	_________________"
	echo ""
	printf "${BGreen}"
	echo "	1. Show Tables"
	echo "	2. Create Table"
	echo "	3. Drob Table"
	echo "	4. Use Table"
	echo "	5. Back to main menu"
	printf "${cf}"

	read -s opt

	case $opt in
		1)
			. ./tbl_show.sh	$DBName
			break ;;
		2)
			. ./tbl_create.sh $DBName
			break ;;
		3)
			. ./tbl_drop.sh $DBName
			break ;;
		4)
			. ./tbl_use.sh $DBName
			break ;;
		5)
			. ./main.sh
			break ;;
	esac

do
	:
done
