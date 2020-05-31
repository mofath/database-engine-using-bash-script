#!/bin/bash

DBName=$1
tblName=$2


while 
	clear
	isExist=0
	read -p "DELETE TABLE " tblName

	tblList=( $(ls -p ./DBs/$DBName | grep -v /) )

	for tbl in  ${tblList[*]}
	do
		if [ "$tblName" = "$tbl" ]; then
			clear
			rm  ./DBs/$DBName/$tblName
			echo ""
			echo "Table deleted successfuly..."
			echo ""
			((isExist++))
			break
		fi
	done

	if [ "$isExist" -eq  0 ]; then
		echo "No Such Table"
	fi

	
	echo ""
	echo "Press any key to get back for the Current Database Menu"
	read
	. ./DB_menu.sh $DBName

do
	:
done

