#!/bin/bash
set -euo pipefail

# COLORS
G='\033[1;32m'      # GREEN
R='\033[1;31m'      # RED
B='\033[0;33m'      # BLUE
P='\033[1;35m'      # PURPLE
O='\033[1;93m'      # ORANGE
D='\033[0m'         # DEFAULT

# VALUES
SCRIPT_NAME="nx_upkeep"
INSTALL_DIR="/usr/local/bin"
SCRIPT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/nexus_command/${SCRIPT_NAME}"

# start here
echo -e "${P}🛠️ NEXUS BOT: ${B}The global command ${P}$SCRIPT_NAME${B} be created in '$SCRIPT_PATH'...${D}"

# CHECK IF COMAND EXISTE IN THIS FOULDER
if [[ ! -f "$SCRIPT_PATH" ]]; then
    echo -e "${P}🛠️ NEXUS BOT: ${R}You removed the script from this foulder, please return it...${D}"
    exit 1
fi

# INSTAL THE SCRIPT
sudo cp -uv "$SCRIPT_PATH" "$INSTALL_DIR"
sudo chmod +x "$INSTALL_DIR/${SCRIPT_NAME}"

# ENDING
echo -e "${P}🛠️ NEXUS BOT: ${G}The ${P}NEXUS-COMAND${G} has be instaled!!!"
echo ""
echo -e "for execute it write ${B}$SCRIPT_NAME${G} in your console...${D}"