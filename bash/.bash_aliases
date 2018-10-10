################################################################################
# LINUX CONFIGURATION
################################################################################
export EDITOR=/usr/bin/vim

alias fix_sound='pulseaudio --kill && pulseaudio --start'
alias fix_monitor='xrandr --output VGA-2 --left-of VGA-1'

function save_command() {
    tail -n 1 ~/.bash_history >> ~/.cmds
    sort -n ~/.cmds | uniq > ~/.cmds_tmp
    rm ~/.cmds
    mv ~/.cmds_tmp ~/.cmds
}

## Preserve history
export HISTCONTROL=ignoredups:erasedups
# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend

# After each command, append to the history file and reread it
export PROMPT_COMMAND='history -a; history -c; history -r;'


################################################################################
# COMMON UNIX HELPERS
################################################################################

# ls (mostly defaults from Ubuntu)
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

alias ff='find . -name'

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


################################################################################
# APPLICATIONS
################################################################################

## Apt
alias ai='sudo apt install'
alias au='sudo apt update && sudo apt upgrade'

## Bat
export BAT_THEME="GitHub"

## Git
alias g='git'
__git_complete g _git


export ANDROID_HOME=/home/ntfournier/Applications/Android/Sdk/

## Java
export JAVA_HOME=/usr/lib/jvm/java-8-oracle/
export PATH=~/Applications/maven/bin/:$PATH

alias pmd="~/Applications/pmd-bin-6.3.0/bin/run.sh pmd"

## Kubernetes
alias kubectl='~/Applications/kubectl'
source <(kubectl completion bash)

## NPM
export PATH=~/.config/npm-global/bin:$PATH

## pgcli
alias pg_cli='pgcli'

## Python
source ~/.config/python36/bin/activate
alias sve='source ./venv/bin/activate'

## Ranger
# alias ranger='ranger --choosedir=$HOME/.config/ranger/last_dir; LASTDIR=`cat $HOME/.config/ranger/last_dir`; cd "$LASTDIR"'

## Vim
export VIMRC=~/.vimrc

## VSCode
alias c='code'

## Yarn
export PATH="~/.config/yarn-global/node_modules/.bin:$PATH"


# PROMPT
source /home/ntfournier/Configs/dotfiles/bash/bash_prompt.sh


