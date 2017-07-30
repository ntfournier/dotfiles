#!/bin/bash

unameOut="$(uname -s)"
case "${unameOut}" in
Linux*)
	echo "Installing dotfiles on Linux"
	sudo apt-get install stow -y
	stow -t ~ bash
	stow -t ~ compton
	stow -t ~ git
	stow -t ~ guake
	stow -t ~ i3
	stow -t ~ vim
	stow -t ~ vscode;;
MINGW*)
	echo "Installing dotfiles on MINGW"
	ln vim/.vimrc ~;;
esac

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
