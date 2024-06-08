#!/bin/bash
echo https://chatgpt.com/share/0a163682-0ecb-4b2c-a3ca-707ff552f7e9
# Memperbarui daftar paket dan menginstal xfce4, xfce4-goodies, neofetch, dan git
sudo apt update
sudo apt install -y xfce4 xfce4-goodies neofetch git

# Menginstal xrdp
sudo apt install -y xrdp

# Menulis "xfce4-session" ke file .xsession di direktori home pengguna
echo "xfce4-session" | tee "$HOME/.xsession"

# Memulai ulang layanan xrdp
sudo service xrdp restart
