#!/bin/bash
sudo pacman -Syyu
pac_soft='base-devel zsh ranger tmux git neovim wget neofetch unzip python-pip nodejs npm yarn go fd ripgrep lazygit ibus-rime'
sudo pacman -S $pac_soft

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

pip install pynvim flake8 black
sudo npm i -g neovim prettier
cargo install stylua

git config --global credential.helper store

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z

git clone https://github.com/ch4m1gn0n/rime-wubi86-jidian ~/.config/ibus/rime

cp -r ./nvim ~/.config/nvim
cp -rif ./.zshrc ~/.zshrc
cp -rif ./.tmux.conf ~/.tmux.conf


yay -S Xampp
