#!/usr/bin/env bash
source "$(dirname "$0")/logger.sh"

clear
echo -e "${CYAN}====================================${NC}"
echo -e "${BOLD}        NETWORK INFORMATION         ${NC}"
echo -e "${CYAN}====================================${NC}"

echo -e "${GREEN}Local IP Address:${NC} $(hostname -I | awk '{print $1}')"
echo -e "${GREEN}Default Gateway:${NC}  $(ip route | grep default | awk '{print $3}')"
echo -e "${GREEN}DNS Servers:${NC}      $(grep "nameserver" /etc/resolv.conf | awk '{print $2}' | tr '\n' ' ')"
echo -e "${GREEN}Hostname:${NC}         $(hostname)"

echo -e "\n${YELLOW}Open Listening Ports (TCP/UDP):${NC}"
ss -tuln | head -n 10

echo -e "\n${YELLOW}Active Network Interfaces:${NC}"
ip -br addr

log_action "Viewed Network Information"
pause
