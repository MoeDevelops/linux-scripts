#!/bin/bash

# Install system packages
sudo dnf install neofetch

# Add flathub repository
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Install flatpaks from flathub
flatpak install flathub -y com.github.tchx84.Flatseal com.discordapp.Discord com.usebottles.bottles com.brave.Browser io.gitlab.librewolf-community org.libreoffice.LibreOffice org.gimp.GIMP