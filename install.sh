#!/data/data/com.termux/files/usr/bin/bash

clear
echo ""
echo "╔══════════════════════════════════════╗"
echo "║      AUTO RUN INSTALL REALSENSI     ║"
echo "╚══════════════════════════════════════╝"
echo ""

# Spinner
spinner() {
    local pid=$!
    local spin='-\|/'
    local i=0
    while kill -0 $pid 2>/dev/null; do
        i=$(( (i+1) %4 ))
        printf "\r[•] Installing modules... ${spin:$i:1}"
        sleep 0.1
    done
    printf "\r[✔️] Installation complete!        \n"
}

# Update & Install Python & pip
(
yes | pkg update -y
yes | pkg upgrade -y
yes | pkg install python -y
yes | pkg install python-pip -y
) & spinner

# Install modules (edit here if more needed)
(
yes | pip install requests
yes | pip install rich
yes | pip install beautifulsoup4
yes | pip install urllib3
yes | pip install colorama
) & spinner

# Jalankan file .so
chmod +x realsensi.so
./realsensi.so
