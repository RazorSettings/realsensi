#!/data/data/com.termux/files/usr/bin/bash
clear

echo -e "\033[1;92m[•] AUTO RUN INSTALL REALSENSI\033[0m"
echo ""
echo -e "\033[1;94m[•] Memeriksa dan menginstall module yang dibutuhkan...\033[0m"

modules=(requests rich colorama urllib3)

for module in "${modules[@]}"; do
    python -c "import $module" 2>/dev/null
    if [ $? -ne 0 ]; then
        echo "[!] Module '$module' belum terpasang. Menginstall..."
        yes | pip install $module
    else
        echo "[✓] Module '$module' sudah terpasang."
    fi
done

echo ""
echo -e "\033[1;92m[✓] Instalasi selesai. Menjalankan tools...\033[0m"
chmod +x realsensi.so
./realsensi.so
