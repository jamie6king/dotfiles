#!/bin/bash

#
# --- Dotfiles Installer
#


# --- install

# zsh
rm -r "${HOME}/.antigen.zsh"
rm -rf "${HOME}/.antigen/"
rm -r "${HOME}/.zshenv"
rm -r "${HOME}/.zprofile"
rm -r "${HOME}/.zshrc"
rm -r "${HOME}/.zlogin"
rm -r "${HOME}/.zlogout"

curl -L git.io/antigen > "${HOME}/.antigen.zsh"

ln "./ZSH/zshenv" "${HOME}/.zshenv"
ln "./ZSH/zshrc" "${HOME}/.zshrc"
