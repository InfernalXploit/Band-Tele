#!/bin/bash

LOCK_FILE="$HOME/.termux_lock"
PASSWORD="infernalxploit" # Ganti dengan password kamu
SCRIPT_PATH="$HOME/lock_termux.sh" # Nama file script ini

# Matikan fungsi CTRL+C, CTRL+Z, dan keluar paksa
trap '' SIGINT SIGTSTP SIGQUIT SIGTERM

# Tambahkan auto-start ke .bashrc kalau belum ada
if ! grep -q "$SCRIPT_PATH" "$HOME/.bashrc"; then
    echo "bash $SCRIPT_PATH" >> "$HOME/.bashrc"
fi

# Kalau file lock sudah ada, langsung lanjut ke Termux normal
if [ -f "$LOCK_FILE" ]; then
    exit 0
fi

# Banner Keren
clear
echo -e "\033[1;31m████████╗███████╗██████╗ ███╗   ██╗███╗   ██╗██╗  ██╗\033[0m"
echo -e "\033[1;31m╚══██╔══╝██╔════╝██╔══██╗████╗  ██║████╗  ██║██║ ██╔╝\033[0m"
echo -e "\033[1;31m   ██║   █████╗  ██████╔╝██╔██╗ ██║██╔██╗ ██║█████╔╝ \033[0m"
echo -e "\033[1;31m   ██║   ██╔══╝  ██╔══██╗██║╚██╗██║██║╚██╗██║██╔═██╗ \033[0m"
echo -e "\033[1;31m   ██║   ███████╗██║  ██║██║ ╚████║██║ ╚████║██║  ██╗\033[0m"
echo -e "\033[1;31m   ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═══╝╚═╝  ╚═╝\033[0m"
echo -e "\033[1;34m   [ LOCKED BY INFERNALXPLOIT ]\033[0m"
echo ""

# Minta password sampai benar
while true; do
    echo -n -e "\033[1;32m[+] Masukkan Password: \033[0m"
    read -s input
    echo ""

    if [ "$input" == "$PASSWORD" ]; then
        touch "$LOCK_FILE" # Buat file lock agar tidak minta password lagi
        echo -e "\033[1;36m[✔] Akses Diterima, Selamat Datang!\033[0m"
        sleep 2
        break
    else
        echo -e "\033[1;31m[✘] Password salah! Coba lagi.\033[0m"
        sleep 2
    fi
done