#!/usr/bin/env bash
source "$(dirname "$0")/logger.sh"

while true; do
    clear
    echo -e "${CYAN}====================================${NC}"
    echo -e "${BOLD}         USER MANAGEMENT            ${NC}"
    echo -e "${CYAN}====================================${NC}"
    echo "1. Create User"
    echo "2. Delete User"
    echo "3. Lock User Account"
    echo "4. Unlock User Account"
    echo "5. Change User Password"
    echo "6. List Standard Users"
    echo "7. Return to Main Menu"
    echo "------------------------------------"
    read -p "Select choice [1-7]: " choice

    case $choice in
        1)
            read -p "Enter new username: " uname
            sudo useradd -m "$uname" && echo -e "${GREEN}User $uname created.${NC}"
            log_action "Created user account: $uname"
            pause
            ;;
        2)
            read -p "Enter username to delete: " uname
            sudo userdel -r "$uname" && echo -e "${GREEN}User $uname removed.${NC}"
            log_action "Deleted user account: $uname"
            pause
            ;;
        3)
            read -p "Enter username to lock: " uname
            sudo usermod -L "$uname" && echo -e "${GREEN}Locked $uname.${NC}"
            log_action "Locked user account: $uname"
            pause
            ;;
        4)
            read -p "Enter username to unlock: " uname
            sudo usermod -U "$uname" && echo -e "${GREEN}Unlocked $uname.${NC}"
            log_action "Unlocked user account: $uname"
            pause
            ;;
        5)
            read -p "Enter username: " uname
            sudo passwd "$uname"
            log_action "Changed password for user: $uname"
            pause
            ;;
        6)
            echo -e "${YELLOW}User accounts (UID >= 1000):${NC}"
            awk -F: '$3 >= 1000 && $3 != 65534 { print $1 " (UID: " $3 ")" }' /etc/passwd
            log_action "Listed user accounts"
            pause
            ;;
        7) break ;;
        *) echo -e "${RED}Invalid choice.${NC}"; sleep 1 ;;
    esac
done
