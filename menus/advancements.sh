# Advancements Menu Script

#
# LAYER 1 ADVANCEMENTS
#

advancements_menu() {	
while :
do
	clear
	printf "ADVANCEMENTS MENU\n1. ADVANCEMENT MANAGEMENT\n2. ADVANCEMENT CRITERION MANAGEMENT\n3. ADVANCEMENT FETCHING\n9. EXIT\n"
	read ACH_SELECT_VAR
	case "$ACH_SELECT_VAR" in
		1) advancement_management_menu ;;
		2) advancement_criterion_management_menu ;;
		9) break ;;
		*) printf "Invalid option" ;;
	esac
done
}

#
# LAYER 2 ADVANCEMENTS
#
#

advancement_criterion_management_menu() {
while :
do 
	clear
	printf "ADVANCEMENT CRITERION MANAGEMENT\n1. GRANT CRITERION\n2. REVOKE CRITERION\n9. EXIT\n"
	read ACH_CRT_MGT_VAR
	case "$ACH_CRT_MGT_VAR" in
		1) 
			printf "Input target player username (or player target selector): "
			read TARGET
			printf "Input advancement resource location: "
			read RESOURCE_LOCATION
			printf "Input advancement criterion resource location: "
			read CRITERION_RESOURCE_LOCATION
			clear
			OUTPUT=$(grant_advancement_criterion 2>&1)
			printf '%s\n' "$OUTPUT"
			wait_for_user
		;;
		2)
			printf "Input target player username (or player target selector): "
			read TARGET
			printf "Input advancement resource location: "
			read RESOURCE_LOCATION
			printf "Input advancement criterion resource location: "
			read CRITERION_RESOURCE_LOCATION
			clear
			OUTPUT=$(revoke_advancement_criterion 2>&1)
			printf '%s\n' "$OUTPUT"
			wait_for_user
		;;
		9) break ;;
		*) clear
			printf "Invalid option" 
		;;
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
		1)advancement_grant_menu
			;;
		2) advancement_revoke_menu
			;;
		9) break ;;
		*) ;;
	esac
done
}

#
# LAYER 3 ADVANCEMENTS
#

advancement_grant_menu() {	
while :
do
	clear
	printf "ADVANCEMENT GRANT MENU\n1. ONLY\n2. EVERYTHING\n9. EXIT\n"
	read ACH_GRT_VAR
	case "$ACH_GRT_VAR" in
		1) clear 
			printf "Input target player username (or player target selector): "
			read TARGET
			printf "Input advancement resource location: "
			read RESOURCE_LOCATION
			clear
			OUTPUT=$(grant_only_advancement 2>&1)
			printf '%s\n' "$OUTPUT"
			wait_for_user
		;;
		
		2) clear
			printf "Input target player username (or player target selector): "
			read TARGET
			clear
			OUTPUT=$(grant_every_advancement 2>&1)
			printf '%s\n' "$OUTPUT"
			wait_for_user
		;;
		9) break ;;
		*) ;;
	esac
done
}

advancement_revoke_menu() {
while :
do
	clear
	printf "ADVANCEMENT REVOKE MENU\n1. ONLY\n2. EVERYTHING\n9. EXIT\n"
	read ACH_GRT_VAR
	case "$ACH_GRT_VAR" in
		1) clear
			printf "Input target player username (or player target selector): "
			read TARGET
			printf "Input advancement resource location: "
			read RESOURCE_LOCATION
			clear
			OUTPUT=$(revoke_only_advancement 2>&1)
			printf '%s\n' "$OUTPUT"
			wait_for_user
		;;
		
		2) clear
			printf "Input target player username (or player target selector): "
			read TARGET
			clear
			OUTPUT=$(revoke_every_advancement 2>&1)
			printf '%s\n' "$OUTPUT"
			wait_for_user
		;;
		9) break ;;
		*) ;;
	esac
done
}
