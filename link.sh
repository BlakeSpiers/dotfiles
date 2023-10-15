#!/usr/bin/env bash

rm -rf ~/.config/nvim
ln -s $(pwd)/nvim ~/.config/nvim

rm -rf ~/.config/alacritty
ln -s $(pwd)/alacritty ~/.config/alacritty

rm -rf ~/.zshrc
ln -s $(pwd)/.zshrc ~/.zshrc

rm -rf ~/.tmux.conf
ln -s $(pwd)/.tmux.conf ~/.tmux.conf
