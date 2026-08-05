#!/usr/bin/env bash
source "$(dirname "$0")/logger.sh"

while true; do
    clear
    echo -e "${CYAN}====================================${NC}"
    echo -e "${BOLD}        SERVICE MANAGEMENT          ${NC}"
    echo -e "${CYAN}====================================${NC}"
    echo "1. List Active Services"
    echo "2. List Failed Services"
    echo "3. Check Service Status"
    echo "4. Restart a Service (Requires sudo)"
    echo "5. Return to Main Menu"
    echo "------------------------------------"
    read -p "Select choice [1-5]: " choice

    case $choice in
        1)
            systemctl list-units --type=service --state=running | head -n 20
            log_action "Listed Active Services"
            pause
            ;;
        2)
            systemctl --failed --type=service
            log_action "Checked Failed Services"
            pause
            ;;
        3)
            read -p "Enter service name (e.g. ssh, nginx): " sname
            systemctl status "$sname"
            log_action "Checked status for service: $sname"
            pause
            ;;
        4)
            read -p "Enter service name to restart: " sname
            sudo systemctl restart "$sname" && echo -e "${GREEN}Service restarted successfully.${NC}" || echo -e "${RED}Failed to restart service.${NC}"
            log_action "Attempted restart on service: $sname"
            pause
            ;;
        5) break ;;
        *) echo -e "${RED}Invalid selection.${NC}"; sleep 1 ;;
    esac
done
