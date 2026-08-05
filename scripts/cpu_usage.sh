#!/usr/bin/env bash
source "$(dirname "$0")/logger.sh"

clear
echo -e "${CYAN}====================================${NC}"
echo -e "${BOLD}         CPU RESOURCE USAGE         ${NC}"
echo -e "${CYAN}====================================${NC}"

echo -e "${GREEN}CPU Model:${NC}     $(lscpu | grep "Model name" | sed -e 's/Model name:[[:space:]]*//')"
echo -e "${GREEN}CPU Cores:${NC}     $(nproc)"
echo -e "${GREEN}Load Average:${NC}  $(uptime | awk -F'load average:' '{ print $2 }')"
echo ""
echo -e "${YELLOW}Top 5 CPU-Consuming Processes:${NC}"
ps -eo pid,ppid,cmd,%cpu --sort=-%cpu | head -n 6

log_action "Viewed CPU Resource Usage"
pause
