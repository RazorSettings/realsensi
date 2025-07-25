#!/bin/bash

green="\e[1;32m"
blue="\e[1;34m"
red="\e[1;31m"
reset="\e[0m"

spinner() {
    local pid=$!
    local delay=0.1
    local spinstr='|/-\'
    while [ -d /proc/$pid ]; do
        local temp=${spinstr#?}
        printf " [%c]  " "$spinstr"
        spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
}

clear
echo -e "${green}"
echo "╔═════════════════════════════════════════════════╗"
echo "║        AUTO RUN INSTALL REALSENSI TOOL          ║"
echo "╚═════════════════════════════════════════════════╝"
echo -e "${reset}"

echo -e "${blue}[•] Updating Termux...${reset}"
yes | pkg update -y &> /dev/null & spinner
yes | pkg upgrade -y &> /dev/null & spinner

echo -e "${blue}[•] Installing dependencies...${reset}"
yes | pkg install git curl wget bash python -y &> /dev/null & spinner

echo -e "${blue}[•] Installing Python modules...${reset}"
(pip install requests colorama rich --quiet --break-system-packages) & spinner

echo -e "${blue}[•] Cloning repository dari GitHub...${reset}"
(cd $HOME && rm -rf realsensi && git clone https://github.com/RazorSettings/realsensi) &> /dev/null & spinner

echo -e "${blue}[•] Menyiapkan file realsensi.so...${reset}"
cd $HOME/realsensi
chmod +x realsensi.so

echo -e "${green}[✓] Instalasi selesai. REALSENSI! RUN..${reset}"
sleep 1
./realsensi.so