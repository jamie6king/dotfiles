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

# gentoo
if [[ ${DEVICE} -eq 1 || ${DEVICE} -eq 2 ]]; then

    sudo rm "/etc/portage/make.conf"
    sudo rm -r "/etc/portage/package.accept_keywords"
    sudo rm -r "/etc/portage/package.mask"
    sudo rm -r "/etc/portage/package.use"
    sudo rm -r "/etc/portage/repos.conf"

    sudo mkdir -p "/etc/portage/package.accept_keywords"
    sudo mkdir -p "/etc/portage/package.mask"
    sudo mkdir -p "/etc/portage/package.use"
    sudo mkdir -p "/etc/portage/repos.conf"

    sudo ln -s "$(pwd)/Gentoo/10-kernel-use" "/etc/portage/package.use/10-kernel"
    sudo ln -s "$(pwd)/Gentoo/25-gtk-use" "/etc/portage/package.use/25-gtk"
    sudo ln -s "$(pwd)/Gentoo/25-mesa-use" "/etc/portage/package.use/25-mesa"
    sudo ln -s "$(pwd)/Gentoo/25-pipewire-use" "/etc/portage/package.use/25-pipewire"
    sudo ln -s "$(pwd)/Gentoo/25-plymouth-use" "/etc/portage/package.use/25-plymouth"
    sudo ln -s "$(pwd)/Gentoo/50-librewolf-accept" "/etc/portage/package.accept_keywords/50-librewolf"
    sudo ln -s "$(pwd)/Gentoo/50-librewolf-use" "/etc/portage/package.use/50-librewolf"
    sudo ln -s "$(pwd)/Gentoo/50-lutris-accept" "/etc/portage/package.accept_keywords/50-lutris"
    sudo ln -s "$(pwd)/Gentoo/50-lutris-use" "/etc/portage/package.use/50-lutris"
    sudo ln -s "$(pwd)/Gentoo/50-vscodium-use" "/etc/portage/package.use/50-vscodium"
    sudo ln -s "$(pwd)/Gentoo/75-gnome-use" "/etc/portage/package.use/75-gnome"
    sudo ln -s "$(pwd)/Gentoo/85-wev-accept" "/etc/portage/package.accept_keywords/85-wev"

    if [[ ${DEVICE} -eq 1 ]]; then

        sudo ln -s "$(pwd)/Gentoo/00-glados-cpu-flags" "/etc/portage/package.use/00-cpu-flags"
        sudo ln -s "$(pwd)/Gentoo/00-glados-make.conf" "/etc/portage/make.conf"
        sudo ln -s "$(pwd)/Gentoo/25-glados-amd-use" "/etc/portage/package.use/25-amd"
        sudo ln -s "$(pwd)/Gentoo/25-glados-wayland-use" "/etc/portage/package.use/25-wayland"
        sudo ln -s "$(pwd)/Gentoo/50-glados-kde-use" "/etc/portage/package.use/50-kde"

    elif [[ ${DEVICE} -eq 2 ]]; then
        
        sudo ln -s "$(pwd)/Gentoo/00-wheatley-cpu-flags" "/etc/portage/package.use/00-cpu-flags"
        sudo ln -s "$(pwd)/Gentoo/00-wheatley-make.conf" "/etc/portage/make.conf"
        sudo ln -s "$(pwd)/Gentoo/00-wheatley-repos.conf" "/etc/portage/repos.conf/eselect-repo.conf"
        sudo ln -s "$(pwd)/Gentoo/25-wheatley-ly-accept" "/etc/portage/package.accept_keywords/25-ly"
        sudo ln -s "$(pwd)/Gentoo/25-wheatley-power-accept" "/etc/portage/package.accept_keywords/25-power"
        sudo ln -s "$(pwd)/Gentoo/25-wheatley-wayland-use" "/etc/portage/package.use/25-wayland"
        sudo ln -s "$(pwd)/Gentoo/50-wheatley-file-roller-mask" "/etc/portage/package.mask/50-file-roller"
        sudo ln -s "$(pwd)/Gentoo/50-wheatley-nemo-use" "/etc/portage/package.use/50-nemo"
        sudo ln -s "$(pwd)/Gentoo/50-wheatley-sway-use" "/etc/portage/package.use/50-sway"
        sudo ln -s "$(pwd)/Gentoo/50-wheatley-waybar-use" "/etc/portage/package.use/50-waybar"
        sudo ln -s "$(pwd)/Gentoo/75-wheatley-catppuccin-accept" "/etc/portage/package.accept_keywords/75-catppuccin"
        sudo ln -s "$(pwd)/Gentoo/75-wheatley-catppuccin-use" "/etc/portage/package.use/75-catppuccin"
        sudo ln -s "$(pwd)/Gentoo/75-wheatley-nwg-accept" "/etc/portage/package.accept_keywords/75-nwg"
    
    fi
fi

# git

rm "${HOME}/.gitconfig"
rm "${HOME}/.gitconfig-contrib"
rm "${HOME}/.gitconfig-hx"
rm "${HOME}/.gitconfig-makers"
rm "${HOME}/.gitconfig-null"
rm "${HOME}/.gitconfig-personal"

ln "./Git/gitconfig" "${HOME}/.gitconfig"
ln "./Git/gitconfig-contrib" "${HOME}/.gitconfig-contrib"
ln "./Git/gitconfig-hx" "${HOME}/.gitconfig-hx"
ln "./Git/gitconfig-makers" "${HOME}/.gitconfig-makers"
ln "./Git/gitconfig-null" "${HOME}/.gitconfig-null"
ln "./Git/gitconfig-personal" "${HOME}/.gitconfig-personal"


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

# sway
if [[ ${DEVICE} -eq 2 ]]; then

    rm -r "${HOME}/.config/sway"
    
    mkdir -p "${HOME}/.config/sway"

    ln "./Sway/config" "${HOME}/.config/sway/config"

fi

# wallpaper
if [[ ${DEVICE} -eq 2 ]]; then

    rm "${HOME}/.wallpaper.png"

    ln "./Wallpapers/wheatley-wallpaper.png" "${HOME}/.wallpaper.png"

fi

# waybar
if [[ ${DEVICE} -eq 2 ]]; then

    rm -r "${HOME}/.config/waybar"

    mkdir -p "${HOME}/.config/waybar"

    ln "./Waybar/config.jsonc" "${HOME}/.config/waybar/config"
    ln "./Waybar/style.css" "${HOME}/.config/waybar/style.css"

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

if [[ ${DEVICE} -eq 1 || ${DEVICE} -eq 2 ]]; then

    ln "./ZSH/desktop-zshenv" "${HOME}/.zshenv"
    ln "./ZSH/gentoo-zshrc" "${HOME}/.zshrc"

elif [[ ${DEVICE} -eq 3 ]]; then

    ln "./ZSH/caroline-zshrc" "${HOME}/.zshrc"

elif [[ ${DEVICE} -eq 4 ]]; then

    ln "./ZSH/hx-zshenv" "${HOME}/.zshenv"
    ln "./ZSH/hx-zshrc" "${HOME}/.zshrc"

fi
