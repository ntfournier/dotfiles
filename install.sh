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
	ln bash/.bash_aliases ~
	ln bash/.bash_profile ~
	ln bash/.dircolors ~
	ln git/.gitconfigWindows ~/.gitconfig
	mkdir -p ~/.config/git/
	ln git/.config/git/gitignore_global ~/.config/git/
	ln vim/.vimrc ~
	ln vscode/.config/Code/User/settings.json $APPDATA/Code/User/
	ln vscode/.config/Code/User/keybindings.json $APPDATA/Code/User/
	ln vscode/.config/Code/User/snippets/javascript.json $APPDATA/Code/User/snippets/
	ln autohotkey/default.ahk $APPDATA/Microsoft/Windows/Start\ Menu/Programs/Startup/
	;;
esac

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
