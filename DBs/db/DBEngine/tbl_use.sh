#!/bin/bash

DBName=db
isExist=0

while 
	clear
	echo ""
	echo ""
	printf "${BWhite}"
	echo "		Use Existing Table in $DBName Database"
	echo ""
	echo ""
	printf "${BYellow}"
	echo -ne  "	USE TABLE " 
	printf "${cf}" 
	read tblName 


	tblList=( $(ls -p ./DBs/$DBName | grep -v /) )

	for tbl in  ${tblList[*]}
	do
		if [ "$tblName" = "$tbl" ]; then
			((isExist++))
			. ./tbl_menu.sh $DBName $tblName
			break
		fi
	done

	if [ "$isExist" -eq  0 ]; 
	then
		echo ""
		echo ""
		printf "${BRed}"
		echo "	No Such Table..."
	fi

	echo ""
	echo ""
	printf "${BCyan}"
	echo "	1) Try Again! "
	echo "	2) $DBName Menu"
	echo "	3) Main Menu!"

	read -s opt

	case $opt in
		1)
			. ./tbl_use.sh $DBName
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
