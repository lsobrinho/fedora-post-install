#!/bin/bash

# Instala o RPM Fusion
sudo dnf -y install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Instala o GNOME Tweaks
sudo dnf -y install gnome-tweaks

# Instala o GNOME Extensions
sudo dnf -y install gnome-extensions-app

# Corrige os problemas de codec
sudo dnf -y swap ffmpeg-free ffmpeg --allowerasing
sudo dnf -y groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
sudo dnf -y groupupdate sound-and-video
sudo dnf -y install amrnb amrwb faad2 flac gpac-libs lame libde265 libfc14audiodecoder mencoder x264 x265 ffmpegthumbnailer

# Instala as fontes da Microsoft
sudo dnf -y install https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm

# Instala o repositório flatpak
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Instala o Brave
sudo flatpak -y install flathub com.brave.Browser

# Instala o Google Chrome
sudo flatpak -y install flathub com.google.Chrome

# Instala o Microsoft Edge
sudo flatpak -y install flathub com.microsoft.Edge

# Instala o VLC
sudo flatpak -y install flathub org.videolan.VLC

# Instala o Microsoft VScode
sudo flatpak -y install flathub com.visualstudio.code

# Instala o KeePassXC
sudo flatpak -y install flathub org.keepassxc.KeePassXC

# Instala o VirtualBox
sudo dnf -y install @development-tools
sudo dnf -y install VirtualBox
sudo usermod -a -G vboxusers $USER

# Necessário reiniciar o computador

# Instala o VirtualBox Extension Pack
export VBOX_VER=$(VBoxManage --version | awk -F'r|_' '{print $1}')
wget -P $HOME/Downloads -c https://download.virtualbox.org/virtualbox/$VBOX_VER/Oracle_VirtualBox_Extension_Pack-$VBOX_VER.vbox-extpack
sudo VBoxManage extpack install --replace $HOME/Downloads/Oracle*VirtualBox_Extension_Pack-$VBOX_VER.vbox-extpack
sudo VBoxManage list extpacks
