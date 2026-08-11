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
		3) clear
			printf "Not currently supported"
			wait_for_user
		;;
		9) break ;;
		*) clear 
			printf "Invalid option"
			wait_for_user
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
		1) clear
			printf "Input target player username (or player target selector): "
			read TARGET
			printf "Input advancement resource location: "
			read RESOURCE_LOCATION
			printf "Input advancement criterion resource location: "
			read CRITERION_RESOURCE_LOCATION
			clear
			OUTPUT=$(advancements_function "$ACTION_TYPE" "$TARGET" "$RESOURCE_LOCATION" "$CRITERION_RESOURCE_LOCATION" 2>&1)
			printf '%s\n' "$OUTPUT"
			wait_for_user
		;;
		# Revokes a single advancement criterion from a specified target
		2) clear
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
			wait_for_user
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
			wait_for_user
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
		1) FUNC_NAME="only_advancement"
			grant_revoke_menu_abstract 
		;;		
		2) FUNC_NAME="every_advancement"
			grant_revoke_menu_abstract
		;;
		3) FUNC_NAME="child_advancements"
			grant_revoke_menu_abstract
		;;
		4) FUNC_NAME="parent_advancements"
			grant_revoke_menu_abstract
		;;
		5) FUNC_NAME="child_and_parent_advancements"
			grant_revoke_menu_abstract
		;;
		9) break ;;
		*) clear
			printf "Invalid option"
			wait_for_user
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
	read ACH_REV_VAR
	ACTION_TYPE="revoke"
	case "$ACH_REV_VAR" in
		1) FUNC_NAME="only_advancement"
			grant_revoke_menu_abstract 
		;;
		2) FUNC_NAME="every_advancement"
			grant_revoke_menu_abstract
		;;
		3) FUNC_NAME="child_advancements"
			grant_revoke_menu_abstract
		;;
		4) FUNC_NAME="parent_advancements"
			grant_revoke_menu_abstract
		;;
		5) FUNC_NAME="child_and_parent_advancements"
			grant_revoke_menu_abstract
		;;
		9) break ;;
		*) clear
			printf "Invalid option" 
			wait_for_user
		;;
	esac
done
}
