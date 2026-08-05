#!/usr/bin/env bash
source "$(dirname "$0")/logger.sh"

clear
echo -e "${CYAN}====================================${NC}"
echo -e "${BOLD}         DISK USAGE OVERVIEW        ${NC}"
echo -e "${CYAN}====================================${NC}"

echo -e "${YELLOW}Mounted Filesystems:${NC}"
df -h -x tmpfs -x devtmpfs

echo -e "\n${YELLOW}Block Devices:${NC}"
lsblk -o NAME,SIZE,FSTYPE,TYPE,MOUNTPOINT

log_action "Viewed Disk Usage Information"
pause
