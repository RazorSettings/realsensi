cat > install.sh << 'EOF'
#!/data/data/com.termux/files/usr/bin/bash

# =========================================
#         AUTO INSTALL REALSENSI MODULE
# =========================================

cyan='\033[1;36m'
green='\033[1;32m'
reset='\033[0m'

banner() {
    echo -e "${cyan}========================================="
    echo -e "        AUTO INSTALL REALSENSI MODULE"
    echo -e "=========================================${reset}"
}

spinner() {
    local pid=$!
    local delay=0.1
    local spinstr='|/-\'
    printf "${cyan}Installing dependencies... ${reset}"
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        local temp=${spinstr#?}
        printf " [%c]  " "$spinstr"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
    echo ""
}

install_modules() {
    banner

    pkg update -y && pkg upgrade -y && pkg install python -y && pkg install wget -y && pkg install curl -y &> /dev/null &
    spinner

    pip install --upgrade pip &> /dev/null &
    spinner

    pip install requests tqdm rich &> /dev/null &
    spinner

    echo -e "${green}[✔️] Install complete. Jalankan: chmod +x realsensi.so && ./realsensi.so${reset}"
}

install_modules
EOF

chmod +x install.sh
./install.sh
