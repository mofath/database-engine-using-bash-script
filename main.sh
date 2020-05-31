#!/bin/bash

. ./colors.txt

while
	clear
	echo ""
	echo ""
	printf "${BWhite}"
	echo "		Welcome To The Databae Engine"
	echo ""
	echo ""


	printf "${BYellow}"
	echo "	1. SHOW DATABASES"
	echo "	2. CREATE DATABASES "
	echo "	3. USE DATABASE"
	echo "	4. DROP DATABASE"
	echo "	5. Exit "
	
	read -s opt

	case $opt in
		1)
			. ./DB_show.sh
			break ;;
		2)
			. ./DB_create.sh 
			break ;;
		3)
			. ./DB_use.sh 
			break ;;
		4)
			. ./DB_drop.sh 
			break ;;
		5)
			clear
			break 2;;

	esac
	printf "${cf}"

do
	:
done
