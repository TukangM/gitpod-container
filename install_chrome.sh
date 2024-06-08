#!/bin/bash

# Memperbarui daftar paket
sudo apt update

# Menginstal dependensi yang diperlukan
sudo apt install -y wget

# Mengunduh Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O /tmp/google-chrome-stable_current_amd64.deb

# Menginstal Google Chrome
sudo dpkg -i /tmp/google-chrome-stable_current_amd64.deb

# Memperbaiki dependensi yang hilang (jika ada)
sudo apt -f install -y

# Menghapus file .deb yang sudah tidak diperlukan
rm /tmp/google-chrome-stable_current_amd64.deb

# Menginformasikan bahwa Google Chrome telah berhasil diinstal
echo "Google Chrome telah berhasil diinstal"
