#!/bin/bash

# Default packages are for the configuration and corresponding .config folders
# Install packages after installing base Debian with no GUI

# xorg display server installation
sudo apt install -y xorg xbindkeys xorg-dev

# install timeshift 
sudo apt install -y timeshift

# INCLUDES make,etc.
sudo apt install -y g++ gcc libc6-dev make

# Microcode for Intel/AMD 
# sudo apt install -y amd64-microcode
sudo apt install -y intel-microcode 

# Network Manager
sudo apt install -y network-manager network-manager-gnome

# Installation for Appearance management
sudo apt install -y lxappearance 

# File Manager (eg. pcmanfm,krusader)
sudo apt install -y pcmanfm

# Network File Tools/System Events
sudo apt install -y dialog acpi acpid gvfs-backends timeshift

sudo systemctl enable acpid

# Terminal (eg. terminator,kitty)
sudo apt install -y alacritty

# Sound packages
sudo apt install -y pulseaudio alsa-utils pavucontrol volumeicon-alsa

# Neofetch/HTOP
#sudo apt install -y neofetch htop

# EXA installation
# replace ls command in .bashrc file with line below
# alias ls='exa -al --long --header --color=always --group-directories-first' 
#sudo apt install -y exa

# Printing and bluetooth (if needed)
# sudo apt install -y cups
# sudo apt install -y bluez blueman

# sudo systemctl enable bluetooth
# sudo systemctl enable cups

# Browser Installation (eg. chromium)
# sudo apt install -y firefox-esr 

# Desktop background browser/handler 
# feh --bg-fill /path/to/directory 
# example if you want to use in autostart located in ~/.local/share/dwm/autostart.sh
# sudo apt install -y feh
# sudo apt install -y nitrogen 

# Packages needed dwm after installation
sudo apt install -y rofi libnotify-bin unzip policykit-1-gnome maim

# Command line text editor -- nano preinstalled  -- I like micro but vim is great
# sudo apt install -y micro
sudo apt install -y neovim

# Install fonts
# sudo apt install fonts-font-awesome fonts-ubuntu fonts-liberation2 fonts-liberation fonts-terminus 

# Create folders in user directory (eg. Documents,Downloads,etc.)
xdg-user-dirs-update

# Install Lightdm Console Display Manager
# sudo apt install -y lightdm lightdm-gtk-greeter-settings slick-greeter
# sudo systemctl enable lightdm
# echo 'greeter-session=slick-greeter' >>  sudo tee -a /etc/lightdm/lightdm.conf
# echo 'greeter-hide-user=false' >>  sudo tee -a /etc/lightdm/lightdm.conf

# Ly Console Manager
# Needed packages
sudo apt install -y libpam0g-dev libxcb-xkb-dev
cd 
git clone --recurse-submodules https://github.com/fairyglade/ly
cd ly
make
sudo make install installsystemd
sudo systemctl enable ly.service


# XSessions
 if [[ ! -d /usr/share/xsessions ]]; then
     sudo mkdir /usr/share/xsessions
 fi

sudo apt install -y i3-wm


# Install Nerd Fonts
source ~/dwm-debian/nerdfonts.sh

sudo apt autoremove

printf "\e[1;32mDone! you can now reboot.\e[0m\n"
