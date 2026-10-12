#!/bin/bash

pacman_apps=(
  # Graphics and Esthetics
  'hyprland'
  'hyprlock'
  'hypridle'
  'hyprsunset'
  'hyprshot'
  'hyprpicker'
  # 'hyprland-preview-share-picker'
  'hyprpolkitagent'
  'uwsm'
  'xdg-desktop-portal-hyprland'
  'xdg-desktop-portal-gtk'
  'sddm'
  'qt5-wayland'
  'qt6-wayland'
  'waybar'
  'mako'
  'swaybg'
  'swayosd'
  'ffmpegthumbnailer'
  'nwg-look'
  'adw-gtk-theme'
  'papirus-icon-theme'
  'rofi'
  'libnotify'

  # Fonts
  'ttf-jetbrains-mono-nerd'
  'ttf-cascadia-mono-nerd'
  'noto-fonts'
  'noto-fonts-cjk'
  'noto-fonts-emoji'
  'noto-fonts-extra'

  # Essentials
  'git'           # Version controll
  'neovim'        # Text editor
  'tmux'          # Term multiplexer
  'wget'          # Download files
  'curl'
  'alacritty'
  'nautilus'
  'nautilus-python'
  'evince'
  'imv'
  'mpv'
  'sushi'
  'obs-studio'
  'wireguard-tools'
  'ffmpeg'
  'imagemagick'
  'chromium'

  # CLI Power Basics
  'bat'           # Output highlighting (better cat)
  'eza'           # Listing files with info (better ls)
  'fzf'           # Fuzzy file finder and filtering
  'jq'            # JSON parser, output and query files
  'dust'
  'unzip'
  'whois'
  'perl-image-exiftool'
  'ripgrep'       # Searching within files (better grep)
  'sd'            # RegEx find and replace (better sed)
  'zoxide'        # Auto-learning navigation (better cd)

  # Development, languages, interpriters, compilers, etc
  'texlive-fontsrecommended'
  'texlive-plaingeneric'
  'texlive-langitalian'
  'texlive-latexextra'
  'texlive-fontsextra'
  'texlive-pstricks'
  'texlive-pictures'
  'texlive-binextra'
  'texlive-latex'
  'texlive-bibtexextra'
  'biber'
  'lazydocker'
  'lazygit'
  'tree-sitter-cli'
  'luarocks'

  # Security Utilities
  'gnupg'         # PGP encryption, signing and verifying
  'openssl'       # Cryptography and SSL/TLS Toolkit

  # Monitoring, management and stats
  'btop'          # Live system resource monitoring
  'fastfetch'      # Show off distro and system info
  
  # System utilities
  'power-profiles-daemon'
  'brightnessctl'
  'pipewire'
  'pipewire-alsa'
  'pipewire-jack'
  'pipewire-pulse'
  'wireplumber'
  'playerctl'
  'wiremix'
  'satty'
  'slurp'
  'grim'
  'gpu-screen-recorder'
  'bluez'
  'bluez-utils'
  'blueman'
  'wl-clipboard'
  'wl-clip-persist'
  'iwd'
  'networkmanager'
  'impala'
  'bolt'
  'bluetui'
  'pamixer'
  #'network-manager-applet'
  # 'pavucontrol'
  'gnome-calculator'

  # Pwn
  'openbsd-netcat'
  'gdb'
  'pwninit'
  'one_gadget'
  'patchelf'
  'nasm'
  'sqlmap'
  'nmap'
  'tcpdump'
  'socat'
  'net-tools'

  # Gaming
  'steam'
)
