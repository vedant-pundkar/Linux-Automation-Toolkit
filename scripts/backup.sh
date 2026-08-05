#!/usr/bin/env bash
source "$(dirname "$0")/logger.sh"

clear
echo -e "${CYAN}====================================${NC}"
echo -e "${BOLD}           BACKUP UTILITY           ${NC}"
echo -e "${CYAN}====================================${NC}"

read -p "Enter source directory to backup: " src_dir
read -p "Enter custom archive name (without extension): " backup_name

DEST_DIR="$(dirname "$0")/../backups"
TIMESTAMP=$(date "+%Y%m%d_%H%M%S")
ARCHIVE_FILE="${DEST_DIR}/${backup_name}_${TIMESTAMP}.tar.gz"

if [ ! -d "$src_dir" ]; then
    echo -e "${RED}Error: Source directory '$src_dir' does not exist.${NC}"
    log_action "Backup Failed: $src_dir does not exist"
    pause
    exit 1
fi

echo -e "${YELLOW}Creating compressed archive...${NC}"
tar -czvf "$ARCHIVE_FILE" -C "$src_dir" . > /dev/null 2>&1

if [ $? -eq 0 ]; then
    echo -e "${GREEN}Backup successfully saved to:${NC} $ARCHIVE_FILE"
    log_action "Backup successful: $ARCHIVE_FILE"
else
    echo -e "${RED}Backup operation failed!${NC}"
    log_action "Backup Failed for source: $src_dir"
fi

pause
