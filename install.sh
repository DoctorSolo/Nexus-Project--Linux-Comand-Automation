#!/bin/env bash
set -euo pipefail

# COLORS
GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
PURPLE='\033[38;5;135m'
DEFAULT='\033[0m'

# VALUES
SCRIPT_NAME="nx_upkeep"
INSTALL_DIR="/usr/local/bin/nexus_comand"
SCRIPT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/nexus_comand/${SCRIPT_NAME}.sh"

# start here
echo -e "${RED}🛠️ NEXUS BOT: ${BLUE}The global comand '$SCRIPT_NAME' be created in '$SCRIPT_PATH'...${DEFAULT}"

# CHECK IF COMAND EXISTE IN THIS FOULDER
if [[ ! -f '$SCRIPT_PATH' ]]; then
    echo -e "${RED}🛠️ NEXUS BOT: ${RED}You removed the script from this folder, please return it...${DEFAULT}"
    exit 1
fi

# INSTAL THE SCRIPT
sudo mkdir -p '$INSTALL_DIR'
sudo cp '$SCRIPT_PATH' '$INSTALL_DIR'
sudo chmod +x '$INSTALL_DIR'

# ENDING
echo -e "${RED}🛠️ NEXUS BOT: ${GREEN}The ${PURPLE}NEXUS-COMAND${GREEN} has be instaled!!!"
echo \n
echo -e "for execute it write ${RED}$SCRIPT_NAME${GREEN} in your console...${DEFAULT}"