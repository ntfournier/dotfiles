## Preserve history
export HISTCONTROL=ignoredups:erasedups
shopt -s histappend

# After each command reread history (not sure if useful or annoying)
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

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
alias ai='sudo apt install'
alias au='sudo apt update && sudo apt upgrade'

## Bash
alias sb='source ~/.bashrc'

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
		docker ps --format "table {{.ID}}\t{{.Names}}\t{{with join (split (printf \"%s\" .Ports) \"0.0.0.0:\") \"\"}}{{join (split . \"/tcp\") \"\"}}{{end}}\t{{.Status}}" | alt
		;;
	psa)
		docker ps -a | alt
		;;
	e)
		docker exec -it "${@:2}"
		;;
	eb)
		docker exec -it "${@:2}" //bin/bash
		;;
	*)
		docker "$@"
		;;
	esac
}

function dc() {
	case $1 in
	b)
		docker-compose build
		;;
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
		docker-compose "$@"
		;;
	esac
}

## Kubernetes
export PATH=~/Applications/:$PATH
alias k='kubectl.exe'

## Maven
export PATH=~/Applications/maven/bin/:$PATH

## Nautilus
alias nau='nautilus --no-desktop ./ &'

## NPM
export PATH=~/.npm-global/bin:$PATH

## Python
alias sp3='source ~/.py36/bin/activate'
alias sve='source ./venv/bin/activate'
sp3

## Vim
export VIMRC=~/.vimrc

