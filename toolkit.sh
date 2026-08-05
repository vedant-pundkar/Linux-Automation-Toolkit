#!/usr/bin/env bash

# Load path relative script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/scripts/logger.sh"

while true; do
    clear
    echo -e "${CYAN}========================================${NC}"
    echo -e "${BOLD}        LINUX AUTOMATION TOOLKIT        ${NC}"
    echo -e "${CYAN}========================================${NC}"
    echo -e " Version: ${GREEN}1.0.0${NC} | Author: SysAdmin"
    echo -e "----------------------------------------"
    echo -e " 1) System Information"
    echo -e " 2) CPU Usage"
    echo -e " 3) Memory Usage"
    echo -e " 4) Disk Usage"
    echo -e " 5) Service Management"
    echo -e " 6) User Management"
    echo -e " 7) Backup Utility"
    echo -e " 8) Log Analyzer"
    echo -e " 9) Network Information"
    echo -e "10) ${RED}Exit${NC}"
    echo -e "${CYAN}========================================${NC}"
    read -p "Choose an option [1-10]: " choice

    case $choice in
        1) "$SCRIPT_DIR/scripts/system_info.sh" ;;
        2) "$SCRIPT_DIR/scripts/cpu_usage.sh" ;;
        3) "$SCRIPT_DIR/scripts/memory_usage.sh" ;;
        4) "$SCRIPT_DIR/scripts/disk_usage.sh" ;;
        5) "$SCRIPT_DIR/scripts/services.sh" ;;
        6) "$SCRIPT_DIR/scripts/user_management.sh" ;;
        7) "$SCRIPT_DIR/scripts/backup.sh" ;;
        8) "$SCRIPT_DIR/scripts/log_analyzer.sh" ;;
        9) "$SCRIPT_DIR/scripts/network.sh" ;;
        10) 
            log_action "Exited Linux Automation Toolkit."
            echo -e "${GREEN}Goodbye!${NC}"
            exit 0
            ;;
        *)
            echo -e "${RED}Invalid choice! Please select 1 through 10.${NC}"
            sleep 1
            ;;
    esac
done
