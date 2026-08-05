#!/usr/bin/env bash
source "$(dirname "$0")/logger.sh"

clear
echo -e "${CYAN}====================================${NC}"
echo -e "${BOLD}        MEMORY RESOURCE USAGE       ${NC}"
echo -e "${CYAN}====================================${NC}"

free -h | awk '
/^Mem:/ {
    print "\033[0;32mTotal RAM:\033[0m " $2
    print "\033[0;32mUsed RAM:\033[0m  " $3
    print "\033[0;32mFree RAM:\033[0m  " $4
}
/^Swap:/ {
    print "\033[0;32mTotal Swap:\033[0m " $2
    print "\033[0;32mUsed Swap:\033[0m  " $3
}'

log_action "Viewed Memory Usage"
pause
