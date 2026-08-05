#!/usr/bin/env bash
source "$(dirname "$0")/logger.sh"

clear
echo -e "${CYAN}====================================${NC}"
echo -e "${BOLD}         LOG FILE ANALYZER          ${NC}"
echo -e "${CYAN}====================================${NC}"

TARGET_LOG="/var/log/auth.log"
[ ! -f "$TARGET_LOG" ] && TARGET_LOG="/var/log/secure"
[ ! -f "$TARGET_LOG" ] && TARGET_LOG="/var/log/syslog"

echo -e "${GREEN}Analyzing Log File:${NC} $TARGET_LOG\n"

if [ -r "$TARGET_LOG" ]; then
    echo -e "${YELLOW}Total Error Entries:${NC} $(grep -i "error" "$TARGET_LOG" | wc -l)"
    echo -e "${YELLOW}Total Warning Entries:${NC} $(grep -i "warning" "$TARGET_LOG" | wc -l)"
    echo -e "${YELLOW}Failed SSH Login Attempts:${NC} $(grep -i "failed password" "$TARGET_LOG" | wc -l)"
    
    echo -e "\n${YELLOW}Top Remote IP Addresses in Log:${NC}"
    grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" "$TARGET_LOG" | sort | uniq -c | sort -nr | head -n 5
    log_action "Analyzed log file: $TARGET_LOG"
else
    echo -e "${RED}Permission denied or log file not found at standard path.${NC}"
    log_action "Log Analyzer failed: No accessible system log file found."
fi

pause
