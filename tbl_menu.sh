#!/bin/bash

DBName=$1
tblName=$2

while 
	clear
	echo ""
	echo ""
	printf "${BWhite}"
	echo "		$tblName from $DBName" 
	echo ""
	echo ""
	echo ""
	printf "${BYellow}"

	printf "${BRed}"
	echo "	 Select Operation"
	printf "${cf}"
	echo "	_________________"
	echo ""
	printf "${BYellow}"
	echo "	1. DESC Table"
	printf "${BGreen}"
	echo "	2. Insert New Record"
	echo "	3. Update Recoed"
	echo "	4. Delete Recoed"
	printf "${BPurple}"
	echo "	5. $tblName Menu"
	echo "	6. $DBName Menu"
	echo "	7. Main Menu"

	read -s opt

	case $opt in
		1)
			. ./tbl_desc.sh	$DBName $tblName
			break ;;
		2)
			. ./record_insert.sh $DBName $tblName
			break ;;
		3)
			. ./record_update.sh $DBName $tblName
			break ;;
		4)
			. ./record_delete.sh $DBName $tblName
			break ;;
		5)
			. ./main.sh 
			break ;;
	esac
do
	:
done
