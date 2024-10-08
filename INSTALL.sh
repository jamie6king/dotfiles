#!/bin/bash

#
# --- Dotfiles Installer
#

# --- device selection

echo "What device are you installing on?"
echo "01) GLaDOS"
echo "02) Wheatley"
echo "03) Caroline"
echo "04) HX"
echo ""
read -p "Select a device: " DEVICE

# --- install

# kitty
if [[ ${DEVICE} -eq 2 ]]; then

    rm -r "${HOME}/.config/kitty"

    mkdir -p "${HOME}/.config/kitty"

    ln "./Kitty/kitty.conf" "${HOME}/.config/kitty/kitty.conf"

fi

# neovim
rm -r "${HOME}/.config/nvim"

mkdir -p "${HOME}/.config/nvim"

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

if [[ ${DEVICE} -eq 1 ]]; then

    ln "./Neovim/kde-init.vim" "${HOME}/.config/nvim/init.vim"

elif [[ ${DEVICE} -eq 2 || ${DEVICE} -eq 3 || ${DEVICE} -eq 4 ]]; then

    ln "./Neovim/cat-init.vim" "${HOME}/.config/nvim/init.vim"

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

if [[ ${DEVICE} -eq 4 ]]; then
    ln "./ZSH/hx-zshenv" "${HOME}/.zshenv"
fi

ln "./ZSH/zshrc" "${HOME}/.zshrc"
