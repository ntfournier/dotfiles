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

# Helpers
alias ..='cd ..'

# Simple task to append to notify you
# eg: make && callMe
alias callMe='notify-send -u critical "Task done"'

# Applications
## Android SDK
export ANDROID_HOME="/home/ntfournier/Applications/android-sdk-linux/"
export PATH=$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools

## Apt
alias ai='sudo apt-get install'
alias au='sudo apt-get update && sudo apt-get upgrade'

## Bash
alias sb='source ~/.bashrc'

export ALIAS=~/.bash_aliases

## Gradle
export GRADLE_HOME="/home/ntfournier/Applications/gradle-3.2.1/"
export PATH=$PATH:$GRADLE_HOME/bin

## Java
export JAVA_HOME="/usr/lib/jvm/java-8-oracle"

## Nautilus
alias nau='nautilus --no-desktop ./ &'

## NVM
export NVM_DIR="/home/ntfournier/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
nvm use v6.1.0 > /dev/null &

## xcalib
alias night='xcalib -invert -alter'
