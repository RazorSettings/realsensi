#!/data/data/com.termux/files/usr/bin/bash

# ================= AUTO RUN INSTALL REALSENSI =================

spinner() {
    local pid=$!
    local delay=0.1
    local spinstr='|/-\'
    printf "Installing dependencies... "
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
    pkg update -y && pkg upgrade -y && pkg install python -y && pkg install wget -y && pkg install curl -y &> /dev/null &
    spinner

    pip install --upgrade pip &> /dev/null &
    spinner

    pip install requests tqdm rich &> /dev/null &
    spinner

    echo "[✔️] Install complete. Jalankan: chmod +x realsensi.so && ./realsensi.so"
}

install_modules
