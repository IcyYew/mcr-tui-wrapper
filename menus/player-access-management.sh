#!/bin/sh

#
#
# PLAYER ACCESS MANAGEMENT MENU LAYER 1
#
#


player_access_management_menu() {
while :
do
	clear
	printf "PLAYER ACCESS MANAGEMENT\n1. BAN\n2. UNBAN\n3. BANLIST\n4. BAN IP\n5. UNBAN IP\n6. WHITELIST\n9. BACK\n"
	read PA_MGM_VAR
	case $PA_MGM_VAR in
		1)	
			clear
			printf "Input player username or player-type target selector: "
			read TARGET
			printf "Input ban reason: "
			read REASON
			ban_player "$TARGET" "$REASON"
			wait_for_user
		;;
		2) 
			clear
			printf "Input player username or player-type target selector: "
			read TARGET
			unban_player "$TARGET"
			wait_for_user
		;;
		3)
			clear
			list_banlist
			wait_for_user

		;;
		4)
			clear
			printf "Input IP address: "
			read IP_ADDR
			ban_ip
			wait_for_user

		;;
		5)
			clear
			print "Input IP address: "
			read IP_ADDR
			unban_ip
			wait_for_user

		;;
		6) whitelist_management_menu ;;
		9) break ;;
		*) printf "Invalid option" ;;
	esac
done
}
