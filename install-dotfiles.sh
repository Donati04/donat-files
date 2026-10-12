#!/bin/bash

repo_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)

for directory in alacritty bash btop fastfetch hypr mako nvim rofi swayosd theme waybar; do
  ln -sT "$repo_dir/dotfiles/config/$directory" "$HOME/.config/$directory"
done

ln -sT "$repo_dir/dotfiles/config/mimeapps.list" "$HOME/.config/mimeapps.list"
ln -sT "$repo_dir/dotfiles/.bashrc" "$HOME/.bashrc"

ln -sT "$repo_dir/dotfiles/config/nautilus-python" "$HOME/.local/share/nautilus-python"

for executable in "$repo_dir"/dotfiles/bin/*; do
  ln -sT "$executable" "$HOME/.local/bin/$(basename "$executable")"
done
