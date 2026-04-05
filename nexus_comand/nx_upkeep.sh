#!/bin/env bash
set -euo pipefail

# COLORS
GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
DEFAULT='\033[0m'

# THE PROJECT STAR HERE
echo -e "${RED}🛠️ NEXUS BOT: ${BLUE}Updating the pacman & AUR repository...${DEFAULT}"
    update --noconfirm

echo -e "${RED}🛠️ NEXUS BOT: ${BLUE}Updating & clear flatpaks...${DEFAULT}"
    flatpak update -y && flatpak uninstall --unused -y

echo -e "${RED}🛠️ NEXUS BOT: ${BLUE}Removing orphan packages...${DEFAULT}"
    sudo pacman -Rns \$(pacman -Qtdq) --noconfirm 2>/dev/null || echo "No orphans"

echo -e "${RED}🛠️ NEXUS BOT: ${BLUE}Cleaning cache...${DEFAULT}"
    sudo paccache -r -k 2

echo -e "${RED}🛠️ NEXUS BOT: ${BLUE}Cleaning thumbnails & trash...${DEFAULT}"
    find ~/.cache/thumbnails -type f -atime +30 -delete 2>/dev/null
    rm -rf ~/.local/share/Trash/* 2>/dev/null

# ---- NOTIFICATION -----
# send a notice to you when a upkeep finished...
if command -v notify-send > dev/null; then
    notify-send "🛠️ NEXUS BOT: Upkeep completed, you can close bash" --icon=system-software-update

clear
echo -e "${RED}██████╗░██╗░░░██╗  ██████╗░░█████╗░░█████╗░████████╗░█████╗░██████╗░  ░██████╗░█████╗░██╗░░░░░░█████╗░"
echo -e       "██╔══██╗╚██╗░██╔╝  ██╔══██╗██╔══██╗██╔══██╗╚══██╔══╝██╔══██╗██╔══██╗  ██╔════╝██╔══██╗██║░░░░░██╔══██╗"
echo -e       "██████╦╝░╚████╔╝░  ██║░░██║██║░░██║██║░░╚═╝░░░██║░░░██║░░██║██████╔╝  ╚█████╗░██║░░██║██║░░░░░██║░░██║"
echo -e       "██╔══██╗░░╚██╔╝░░  ██║░░██║██║░░██║██║░░██╗░░░██║░░░██║░░██║██╔══██╗  ░╚═══██╗██║░░██║██║░░░░░██║░░██║"
echo -e       "██████╦╝░░░██║░░░  ██████╔╝╚█████╔╝╚█████╔╝░░░██║░░░╚█████╔╝██║░░██║  ██████╔╝╚█████╔╝███████╗╚█████╔╝"
echo -e       "╚═════╝░░░░╚═╝░░░  ╚═════╝░░╚════╝░░╚════╝░░░░╚═╝░░░░╚════╝░╚═╝░░╚═╝  ╚═════╝░░╚════╝░╚══════╝░╚════╝░${DEFAULT}"
echo \n
echo -e "${RED}✅ NEXUS BOT: ${GREEN}Upkeep completed, you can close bash${DEFAULT}"