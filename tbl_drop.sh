#!/bin/bash

DBName=$1
tblName=$2

isExist=0

while 
	clear

		clear
	echo ""
	echo ""
	printf "${BWhite}"
	echo "		Drop Table from $DBName Database"
	echo "		_______________________________"
	echo ""
	echo ""
	echo ""
	printf "${BYellow}"
	echo -ne  "	DROP TABLE " 
	printf "${cf}" 
	read tblName 
	echo ""
	echo ""

	tblList=( $(ls -p ./DBs/$DBName | grep -v /) )

	for tbl in  ${tblList[*]}
	do
		if [ "$tblName" = "$tbl" ]; then
			rm  ./DBs/$DBName/$tblName
			echo ""
			echo ""
			printf "${BBlue}"
			echo "	Table deleted successfuly..."
			echo ""
			((isExist++))
			break
		fi
	done

	if [ "$isExist" -eq  0 ]; then
			echo ""
			echo ""
			printf "${BRed}"
		echo "	No Such Table"
	fi

	
	echo ""
	echo ""
	printf "${BCyan}"
	echo "	1) Drop Another Table "
	echo "	2) $DBName Menu"
	echo "	3) Main Menu!"

	read -s opt

	case $opt in
		1)
			. ./tbl_drop.sh $DBName
			break ;;
		2)
			. ./DB_menu.sh $DBName
			break ;;
		3)
			. ./main.sh
			break ;;
	esac
	printf "${cf}" 

do
	:
done

