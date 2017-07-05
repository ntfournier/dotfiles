TERM=xterm-256color

PS1="\[${PSC}\]\u@\h(\l) \[\e[37m\][ \w ]\[\e[00m\]\[\e[1m\] \$ "

export EDITOR=/usr/bin/vim

# Common Unix
# ls
alias ls='ls -A --color=auto --group-directories-first'
alias ll='ls -alhF'
alias la='ls -A'
alias l='ls -CF'

alias s='. ~/.bashrc'

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

# Path for cd into directories
CDPATH=.:~:~/Projects:~/Configs

# Fix small typos
shopt -s cdspell

# grep
alias grep='grep --color=always'
alias grep-nc='grep --color=never'

## fix some common typos
alias sl='ls'
alias cd..='cd ..'

# Helpers
alias ..='cd ..'

# Simple task to append to notify you
# eg: make && callMe
alias callMe='notify-send -u critical "Task done"'

# Applications

## Apt
alias ai='sudo apt-get install'
alias au='sudo apt-get update && sudo apt-get upgrade'

## Bash
alias sb='source ~/.bashrc'

export ALIAS=~/.bash_aliases


## Nautilus
alias nau='nautilus --no-desktop ./ &'

## xcalib
alias night='xcalib -invert -alter'

