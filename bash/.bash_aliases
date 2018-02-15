## Preserve history
# export HISTCONTROL=ignoredups:erasedups
# shopt -s histappend

# After each command reread history (not sure if useful or annoying)
# export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

export EDITOR=/usr/bin/vim

# Common Unix
# ls
alias ls='ls --color=auto --group-directories-first'
alias ll='ls -alhF'
alias la='ls -A'
alias l='ls -CF'

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

# Path for cd into directories
#CDPATH=.:~/Projects/nuance/sonic/:~/Projects/nuance/aurora

# Fix small typos
shopt -s cdspell

# grep
alias gr='grep --color=always'

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
		echo -e "\e[1;35m$line"
	done
	echo -en "\e[0m"
}


## Apt
alias ai='sudo apt install'
alias au='sudo apt update && sudo apt upgrade'

## Bash
alias sb='source ~/.bashrc'

## Docker
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
	rmiu)
		docker rmi $(docker images | grep "^<none>" | awk "{print $3}")
		;;
	psm)
		docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Status}}" | alt
		;;
	p|psl)
		docker ps --format "table {{.Names}}\t{{with join (split (printf \"%s\" .Ports) \"0.0.0.0:\") \"\"}}{{join (split . \"/tcp\") \"\"}}{{end}}\t{{.Status}}" | alt
		;;
	psa)
		docker ps -a | alt
		;;
	ps)
		docker ps "${@:2}" | alt
		;;
	b)
		docker build "${@:2}"
		;;
	e)
		docker exec -it "${@:2}"
		;;
	eb)
		docker exec -it "${@:2}" //bin/bash
		;;
	rd)
		docker run -d "${@:2}"
		;;
	v)
		docker volume "${@:2}"
		;;
	*)
		docker "$@"
		;;
	esac
}

function dc() {
	case $1 in
	r)
		docker-compose down && docker-compose up -d
		;;
	b)
		docker-compose build
		;;
	k)
		docker-compose kill
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

function k() {
	case $1 in
	cg)
		kubectl config get-contexts
		;;
	cu)
		kubectl config use-context "${@:2}"
		;;
	cc)
		kubectl config current-context
		;;
	g)
		kubectl get "${@:2}"
		;;
	pf)
		kubectl port-forward "${@:2}"
		;;
	*)
		kubectl "$@"
		;;
	esac
}

## Git
alias g='git'

## Kubernetes
export PATH=~/Applications/:$PATH

## Maven
export PATH=~/Applications/maven/bin/:$PATH

## Nautilus
alias nau='nautilus --no-desktop ./ &'

## NPM
export PATH=~/.npm-global/bin:$PATH

## pgcli
alias pg_cli='pgcli'

## Python
alias sve='source ./venv/bin/activate'
alias sp3='source ~/.py36/bin/activate'
# Source Python 3.6
sp3

## Vim
export VIMRC=~/.vimrc

#GIT_PROMPT_ONLY_IN_REPO=1
#source ~/Configs/.bash-git-prompt/gitprompt.sh

alias last='history | head -n-1 | tail -10'

function listHistResults {
	history | grep "$1" | head -n-1 | tail -10
}

alias c='code'

alias ff='find . -name'
