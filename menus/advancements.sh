# Advancements Menu Script

. ../mcrw-functions.lib



advancement_grant_menu() {	
while :
do
	clear
	printf "ADVANCEMENT GRANT MENU\n1. ONLY\n2. EVERYTHING\n9. EXIT\n"
	read ACH_GRT_VAR
	case "$ACH_GRT_VAR" in
		1) 
			printf "Input target player username: "
			read USER_NAME
			printf "Input advancement resource location: "
			read RESOURCE_LOCATION
			OUTPUT=$(grant_only_advancement 2>&1)
			printf '%s\n' "$OUTPUT"
			wait_for_user
			;;
		9) break ;;
		*) ;;
	esac
done
}

advancement_management_menu() {
	
while :
do
	clear
	printf "ADVANCEMENT MANAGEMENT\n1. GRANT\n2. REVOKE\n9. EXIT\n"
	read ACH_MGMT_VAR
	case "$ACH_MGMT_VAR" in
		1)
			advancement_grant_menu
			;;
		2) ;;
		9) break ;;
		*) ;;
	esac
done
}

advancements_menu() {	
while :
do
	clear
	printf "ADVANCEMENTS MENU\n1. ADVANCEMENT MANAGEMENT\n2. ADVANCEMENT FETCHING\n9. EXIT\n"
	read ACH_SELECT_VAR
	case "$ACH_SELECT_VAR" in
		1)
			advancement_management_menu ;;
		2) ;;
		9) break ;;
		*) printf "Not an option" ;;
	esac
done
}
