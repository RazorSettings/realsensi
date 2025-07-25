#!/bin/bash

# Warna
green="\e[1;32m"
blue="\e[1;34m"
red="\e[1;31m"
reset="\e[0m"

# Spinner loading
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

# Update & upgrade
echo -e "${blue}[•] Updating Termux...${reset}"
yes | pkg update -y &> /dev/null & spinner
yes | pkg upgrade -y &> /dev/null & spinner

# Install paket wajib
echo -e "${blue}[•] Installing dependencies...${reset}"
yes | pkg install git curl wget bash python -y &> /dev/null & spinner

# Install pip modules (optional)
echo -e "${blue}[•] Installing Python modules...${reset}"
(pip install requests colorama rich --quiet --break-system-packages) & spinner

# Setup & jalankan file
echo -e "${blue}[•] Menyiapkan realsensi.so...${reset}"
chmod +x realsensi.so

# Jalankan
echo -e "${green}[✓] Instalasi selesai. Menjalankan realsensi.so...${reset}"
sleep 1
./realsensi.so
