#!/bin/bash

DBName=db
tblName=tbl1
p="p"
while 
	clear
	echo ""
	echo ""
	printf "${BWhite}"
	echo "		Select Record from $tblName in $DBName Database"
	echo "		________________________________________"
	echo ""
	echo ""
	echo ""
	printf "${BYellow}"
	echo -ne  "	SELECT FROM $tbl1 wher id = " 
	printf "${cf}" 
	read id 
	echo ""
	echo ""


	((id=id+1))
	myData=$(sed -n $id$p ./DBs/$DBName/$tblName)

	echo ""	
	IFS=$','
	# loop over the header (first row)                           
    	for col in $header
	do
		printf "${BBlue}"
		# and print column headers
        	printf "%10s" $col     
	done
	echo ""	
	
	printf "${BCyan}"
	for col in $header
	do
        	printf "============"    
	done
	echo ""	

	printf "${cf}"
	# loop over selected data                     
    	for row in $myData
	do
        	for val in $row     
		do
			# and print values
            		printf "%10s" $val
		done
	done
	unset IFS
	
	echo ""
	echo ""
	printf "${BCyan}"
	echo "	1) Display Another Record From $tblName"
	echo "	2) $tblName Menu"
	echo "	2) $DBName Menu"
	echo "	3) Main Menu!"

	read -s opt

	case $opt in
		1)
			. ./record_insert.sh $DBName $tblName
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
