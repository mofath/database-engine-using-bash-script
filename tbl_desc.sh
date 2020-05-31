#/bin/bash
. ./colors.txt

DBName=$1
tblName=$2

while 
	clear
	echo ""
	echo ""
	printf "${BPurple}"
	echo "			$tblName from $DBName" 
	echo ""
	echo ""
	echo ""
	header=$(sed -n 1p ./DBs/$DBName/$tblName)
	body=$(sed 1d ./DBs/$DBName/$tblName)

	if [ -z "$body" ]
	then 
		printf "${BRed}"
		echo "	Empty Table, no record added yet"
	else
		IFS=$','
		# loop over the first column                           
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

		printf "${BYellow}"
		# loop over the second                     
    		for row in $body
		do
        		for val in $row     
			do
				# and print values
            			printf "%10s" $val
			done
		done
		unset IFS
		
		echo ""	
		printf "${BCyan}"
		for col in $header
		do
        		printf "============"    
		done
		echo ""	
	fi

	
	echo ""
	echo ""
	printf "${BCyan}"
	echo "	1) $tblName Menu"
	echo "	2) $DBName Menu"
	echo "	3) Main Menu!"

	read -s opt

	case $opt in
		1)
			. ./tbl_menu.sh $DBName $tblName
			break ;;
		2)
			. ./DB_menu.sh $DBName
			break ;;
		3)
			. ./main.sh
			break ;;
	esac
                
do
	:
done
