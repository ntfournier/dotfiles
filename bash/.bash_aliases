TERM=xterm-256color

# Fixing folder colors on Bash on Ubuntu on Windows
[ -e ~/.dircolors ] && eval $(dircolors -b ~/.dircolors) ||
    eval $(dircolors -b)

# export PS1="\n\u@\h:\w\\$ \n"

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

## alternating coloring
function alt() {
	while read line
	do
		echo -e "\e[1;34m$line"
		read line
		echo -e "\e[1;36m$line"
	done
	echo -en "\e[0m"
}


## Apt
alias ai='sudo apt-get install'
alias au='sudo apt-get update && sudo apt-get upgrade'

## Bash
alias sb='source ~/.bashrc'

export ALIAS=~/.bash_aliases

alias bolt='winpty docker exec -it bolt-postgres psql bolt boltwebapp'


## Docker
# Fix this bug https://github.com/moby/moby/issues/24029
function d() {
	case $1 in
	n)
		docker network ls
		;;
	ni)
		docker network inspect "${@:2}"
		;;
	rma)
		echo "Deleting exited containers"
		docker rm $(docker ps -qa --no-trunc --filter "status=exited")
		;;
	p|psl)
		docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Ports}}\t{{.Status}}" | alt
		;;
	psa)
		docker ps -a | alt
		;;
	e)
		docker_winpty exec -it "${@:2}"
		;;
	eb)
		docker_winpty exec -it "${@:2}" //bin/bash
		;;
	*)
		MSYS_NO_PATHCONV=1 /c/Program\ Files/Docker/Docker/Resources/bin/docker.exe "$@"
		;;
	esac
}

function docker_winpty() {
	MSYS_NO_PATHCONV=1 winpty /c/Program\ Files/Docker/Docker/Resources/bin/docker.exe "$@"
}

function dc() {
	case $1 in
	u)
		docker-compose up -d
		;;
	d)
		docker-compose down
		;;
	ul)
		docker-compose up
		;;
	*)
		MSYS_NO_PATHCONV=1 /c/Program\ Files/Docker/Docker/Resources/bin/docker-compose.exe $@
		;;
	esac
}

alias docker-compose='dc'

## Diff-highlight
export PATH=~/bin:$PATH

## Nautilus
alias nau='nautilus --no-desktop ./ &'

## NPM
export PATH=~/.npm-global/bin:$PATH

## Python
export PATH=$PATH:/c/Program\ Files/Python27/python.exe

## xcalib
alias night='xcalib -invert -alter'

