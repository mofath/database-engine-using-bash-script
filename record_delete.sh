#!/bin/bash

DBName=$1
tblName=$2
isExist=0
d="d"
size=0

while 
	clear
	echo ""
	echo ""
	printf "${BWhite}"
	echo "		Delete a Record from $tblName in  $DBName Database"
	echo "		___________________________________"
	echo ""
	echo ""
	echo ""
	printf "${BYellow}"
	echo -ne  "	DELETE RECORD FROM $tblName where id = " 
	printf "${cf}" 
	read id 
	echo ""
	echo ""
	

	size=( $(wc -l ./DBs/$DBName/$tblName) )
	
	if [ $id -gt $size ];
     	then
		printf "${BRed}"
     		echo "	ID is out of range"
    	else
     		sed -i "${id}"d ./DBs/$DBName/$tblName >/dev/null
		printf "${BBlue}"
		echo "	Record deleted successfuly..."
	fi
	
	echo ""
	echo ""
	printf "${BCyan}"
	echo "	1) Delete new Record from $tblName"
	echo "	2) $tblName Menu"
	echo "	3) $DBName Menu"
	echo "	4) Main Menu!"

	read -s opt

	case $opt in
		1)
			. ./record_delete.sh $DBName $tblName
			break ;;
		2)
			. ./tbl_menu.sh $DBName $tblName
			break ;;
		3)
			. ./DB_menu.sh $DBName
			break ;;
		4)
			. ./main.sh
			break ;;
	esac
	printf "${cf}"

do
	:
done

