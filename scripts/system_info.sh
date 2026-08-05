#!/usr/bin/env bash
source "$(dirname "$0")/logger.sh"

clear
echo -e "${CYAN}====================================${NC}"
echo -e "${BOLD}        SYSTEM INFORMATION          ${NC}"
echo -e "${CYAN}====================================${NC}"

echo -e "${GREEN}Hostname:${NC}     $(hostname)"
echo -e "${GREEN}Username:${NC}     $(whoami)"
echo -e "${GREEN}Date/Time:${NC}    $(date)"
echo -e "${GREEN}OS Name:${NC}      $(hostnamectl | grep "Operating System" | cut -d ':' -f 2 | xterm-title 2>/dev/null || cat /etc/os-release | grep PRETTY_NAME | cut -d '=' -f 2 | tr -d '"')"
echo -e "${GREEN}Kernel Version:${NC} $(uname -r)"
echo -e "${GREEN}Architecture:${NC}  $(uname -m)"
echo -e "${GREEN}System Uptime:${NC} $(uptime -p)"

log_action "Viewed System Information"
pause
