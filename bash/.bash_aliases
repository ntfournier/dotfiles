TERM=xterm-256color

export EDITOR=/usr/bin/vim

# Common Unix
# ls
alias ls='ls -A --color=auto --group-directories-first'
alias ll='ls -alhF'
alias la='ls -A'
alias l='ls -CF'

# grep
alias grep='grep --color=always'

## fix some common typos
alias sl='ls'
alias cd..='cd ..'

# Simple task to append to notify you
# eg: make && callMe
alias callMe='notify-send -u critical "Task done"'

# Applications
## Android SDK
export ANDROID_HOME="/home/ntfournier/Applications/android-sdk-linux/"
export PATH=$PATH:/home/ntfournier/Applications/android-sdk-linux/platform-tools

## Apt
alias ai='sudo apt-get install'
alias au='sudo apt-get update'

## IntelliJ Idea
export PATH=$PATH:/home/ntfournier/Applications/idea/bin

## Java
export JAVA_HOME="/usr/lib/jvm/java-8-oracle"

## Markdown
# http://daringfireball.net/projects/markdown/
alias md='~/Applications/Markdown_1.0.1/Markdown.pl'

## NVM
export NVM_DIR="/home/ntfournier/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
nvm use v6.1.0 > /dev/null

## Powerline-shell
function _update_ps1() {
    PS1="$(~/powerline-shell.py $? 2> /dev/null)"
}

if [ "$TERM" != "linux" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi
