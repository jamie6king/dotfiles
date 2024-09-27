#!/bin/bash

#
# --- Dotfiles Installer
#

# --- device selection

echo "What device are you installing on?"
echo "04) HX"
echo ""
read -p "Select a device: " DEVICE

# --- install

# neovim
rm -r "${HOME}/.config/nvim"

mkdir "${HOME}/.config/nvim"

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

if [[ DEVICE -eq 4 ]]; then

    ln "./Neovim/hx-init.vim" "${HOME}/.config/nvim/init.vim"

fi

# zsh
rm "${HOME}/.antigen.zsh"
rm -rf "${HOME}/.antigen/"
rm "${HOME}/.zshenv"
rm "${HOME}/.zprofile"
rm "${HOME}/.zshrc"
rm "${HOME}/.zlogin"
rm "${HOME}/.zlogout"

curl -L git.io/antigen > "${HOME}/.antigen.zsh"

ln "./ZSH/zshenv" "${HOME}/.zshenv"
ln "./ZSH/zshrc" "${HOME}/.zshrc"
