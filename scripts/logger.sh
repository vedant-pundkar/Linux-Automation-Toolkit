#!/usr/bin/env bash

# File paths
LOG_FILE="$(dirname "$0")/../logs/toolkit.log"

# Color Codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m' # No Color

log_action() {
    local message="$1"
    local timestamp
    timestamp=$(date "+%Y-%m-%d %H:%M:%S")
    echo "[$timestamp] $message" >> "$LOG_FILE"
}

pause() {
    echo -e "\n${YELLOW}Press [ENTER] to return to the menu...${NC}"
    read -r
}
