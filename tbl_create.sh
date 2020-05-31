#!/bin/bash

DBName=$1
colArray=()
isExist=0

while 
	clear
	echo ""
	echo ""
	printf "${BWhite}"
	echo "		Create New Table in $DBName Database"
	echo "		___________________________________"
	echo ""
	echo ""
	echo ""
	printf "${BYellow}"
	echo -ne  "	CREATE TABLE " 
	printf "${cf}" 
	read tblName 
	echo ""
	echo ""


	tblList=( $(ls -p ./DBs/$DBName | grep -v /) )

	for tbl in  ${tblList[*]}
	do
		if [ "$tblName" = "$tbl" ]; then

			printf "${BRed}"
			echo "	There is already a table with the same name"
			echo ""
			((isExist++))
			break
		fi
	done

	if [ "$isExist" -eq  0 ]; then
		touch ./DBs/$DBName/$tblName
		chmod 777 ./DBs/$DBName/$tblName
		read -p  "	Number of columns " colNum
		printf "id"  >> ./DBs/$DBName/$tblName
		for ((i = 1; i <= $colNum; ++i)) 
		do
			read -p  "	name of column $i " 
			printf ", $REPLY"  >> ./DBs/$DBName/$tblName
		done
		
		echo ""
		echo ""
		printf "${BGreen}"
		echo "	Table is created successfully..."
	fi

	echo ""
	echo ""
	printf "${BCyan}"
	echo "	1) Main Menu! "
	echo "	2) $DBName Menu"
	echo "	3) Main Menu!"

	read -s opt

	case $opt in
		1)
			. ./tbl_create.sh $DBName
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
