#!/bin/bash

# Check if the script is running with root
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script as root or using sudo."
  exit 1
fi

# Install apt packages
apt update
apt install -y kde-plasma-desktop
apt install -y neofetch kde-spectacle ark dragonplayer flatpak plasma-discover-backend-flatpak

# Install snap
apt install -y snapd plasma-discover-backend-snap

# Hides the snap folder
touch .hidden
echo "snap" > .hidden

# Remove apt packages
apt remove -y zutty konqueror

# Add flathub repository
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Install flatpak packages
echo "Installing KDE flatpaks"
flatpak install flathub -y org.kde.okular org.kde.gwenview org.kde.kcalc org.kde.elisa org.kde.kamoso org.kde.yakuake
echo "Installing misc. flatpaks"
flatpak install flathub -y com.brave.Browser com.discordapp.Discord org.libreoffice.LibreOffice org.gimp.GIMP com.usebottles.bottles com.github.tchx84.Flatseal io.gitlab.librewolf-community

# Cleanup
apt autoremove -y
apt clean

echo "Script completed successfully. Please reboot now."
