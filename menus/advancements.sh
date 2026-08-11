# Advancements Menu Script

#
# LAYER 1 ADVANCEMENTS
#

## Apex advancements menu, submenus: advancement management menu, advancement criterion management menu, advancement fetching
## Advancement fetching is unlikely to be implemented, unrealistic

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
		*) clear 
			printf "Invalid option" 
		;;
	esac
done
}

#
# LAYER 2 ADVANCEMENTS
#

# Advancement criterion management menu allows the granting or revoking of advancement criterions, this can also work on advancements with 
# only a single criterion (obviously)

advancement_criterion_management_menu() {
while :
do 
	clear
	printf "ADVANCEMENT CRITERION MANAGEMENT\n1. GRANT CRITERION\n2. REVOKE CRITERION\n9. EXIT\n"
	read ACH_CRT_MGT_VAR
	case "$ACH_CRT_MGT_VAR" in
		# Grants a single advancement criterion to specified target
		1) 
			printf "Input target player username (or player target selector): "
			read TARGET
			printf "Input advancement resource location: "
			read RESOURCE_LOCATION
			printf "Input advancement criterion resource location: "
			read CRITERION_RESOURCE_LOCATION
			ACTION_TYPE="grant"
			clear
			OUTPUT=$(advancement_criterion 2>&1)
			printf '%s\n' "$OUTPUT"
			wait_for_user
		;;
		# Revokes a single advancement criterion from a specified target
		2)
			printf "Input target player username (or player target selector): "
			read TARGET
			printf "Input advancement resource location: "
			read RESOURCE_LOCATION
			printf "Input advancement criterion resource location: "
			read CRITERION_RESOURCE_LOCATION
			ACTION_TYPE="revoke"
			clear
			OUTPUT=$(advancement_criterion 2>&1)
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

# Advancement management menu allows navigation to the advancement granting and revoking submenus
advancement_management_menu() {
	
while :
do
	clear
	printf "ADVANCEMENT MANAGEMENT\n1. GRANT\n2. REVOKE\n9. EXIT\n"
	read ACH_MGMT_VAR
	case "$ACH_MGMT_VAR" in
		1) advancement_grant_menu ;;
		2) advancement_revoke_menu ;;
		9) break ;;
		*) clear
			printf "Invalid option" 
		;;
	esac
done
}

#
# LAYER 3 ADVANCEMENTS
#

# Advancement grant menu allows the granting of only one or all advancements to a target
advancement_grant_menu() {	
while :
do
	clear
	printf "ADVANCEMENT GRANT MENU\n1. ONLY\n2. EVERYTHING\n3. ALL CHILDREN\n4. ALL PARENTS\n5. ALL PARENTS & CHILDREN\n9. EXIT\n"
	read ACH_GRT_VAR
	ACTION_TYPE="grant"
	case "$ACH_GRT_VAR" in
		1) clear 
			printf "Input target player username (or player target selector): "
			read TARGET
			printf "Input advancement resource location: "
			read RESOURCE_LOCATION
			clear
			OUTPUT=$(only_advancement 2>&1)
			printf '%s\n' "$OUTPUT"
			wait_for_user
		;;
		
		2) clear
			printf "Input target player username (or player target selector): "
			read TARGET
			printf "Input advancement resource location: "
			read RESOURCE_LOCATION
			clear
			OUTPUT=$(every_advancement 2>&1)
			printf '%s\n' "$OUTPUT"
			wait_for_user
		;;
		3) clear
			printf "Input target player username (or player target selector): "
			read TARGET
			printf "Input advancement resource location: "
			read RESOURCE_LOCATION
			clear
			OUTPUT=$(child_advancements 2>&1)
			printf '%s\n' "$OUTPUT"
			wait_for_user
		;;
		4)
			printf "Input target player username (or player target selector): "
			read TARGET
			printf "Input advancement resource location: "
			read RESOURCE_LOCATION
			clear
			OUTPUT=$(parent_advancements 2>&1)
			printf '%s\n' "$OUTPUT"
			wait_for_user
		;;
		5)
			printf "Input target player username (or player target selector): "
			read TARGET
			printf "Input advancement resource location: "
			read RESOURCE_LOCATION
			clear
			OUTPUT=$(child_and_parent_advancements 2>&1)
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

# Advancement revoke menu allows the revoking of one or all advancements from a target
advancement_revoke_menu() {
while :
do
	clear
	printf "ADVANCEMENT REVOKE MENU\n1. ONLY\n2. EVERYTHING\n3. ALL CHILDREN\n4. ALL PARENTS\n5. ALL PARENTS & CHILDREN\n9. EXIT\n"
	read ACH_GRT_VAR
	ACTION_TYPE="revoke"
	case "$ACH_GRT_VAR" in
		1) clear
			printf "Input target player username (or player target selector): "
			read TARGET
			printf "Input advancement resource location: "
			read RESOURCE_LOCATION
			clear
			OUTPUT=$(only_advancement 2>&1)
			printf '%s\n' "$OUTPUT"
			wait_for_user
		;;
		
		2) clear
			printf "Input target player username (or player target selector): "
			read TARGET
			clear
			OUTPUT=$(every_advancement 2>&1)
			printf '%s\n' "$OUTPUT"
			wait_for_user
		;;
		3) clear
			printf "Input target player username (or player target selector): "
			read TARGET
			printf "Input advancement resource location: "
			read RESOURCE_LOCATION
			clear
			OUTPUT=$(child_advancements 2>&1)
			printf '%s\n' "$OUTPUT"
			wait_for_user
		;;
		4)
			printf "Input target player username (or player target selector): "
			read TARGET
			printf "Input advancement resource location: "
			read RESOURCE_LOCATION
			clear
			OUTPUT=$(parent_advancements 2>&1)
			printf '%s\n' "$OUTPUT"
			wait_for_user
		;;
		5)
			printf "Input target player username (or player target selector): "
			read TARGET
			printf "Input advancement resource location: "
			read RESOURCE_LOCATION
			clear
			OUTPUT=$(child_and_parent_advancements 2>&1)
			printf '%s\n' "$OUTPUT"
			wait_for_user
		;;
		9) break ;;
		*) ;;
	esac
done
}
