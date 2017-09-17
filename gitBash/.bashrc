[[ -e "/c/Users/vincent.fournier/.bash_aliases" ]] && source "/c/Users/vincent.fournier/.bash_aliases"

export LOCAL_MIX_API_KEY='zdFqjKn9EWYiqK5SyBl5h5PAbky05JERr4n2qG4h7gk'
export MIX_API_KEY='Jey29CTjSGHvDTVOYudNsZqTEYbYDd4xkzN775bqK1Y'

# Start in home directory for Git Bash
# alias python='winpty python.exe'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

function color_my_prompt {
    local __user_and_host="\[\033[01;32m\]\u@\h"
    local __cur_location="\[\033[01;34m\]\w"
    local __git_branch_color="\[\033[31m\]"
    #local __git_branch="\`ruby -e \"print (%x{git branch 2> /dev/null}.grep(/^\*/).first || '').gsub(/^\* (.+)$/, '(\1) ')\"\`"
    local __git_branch='`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`'
    local __prompt_tail="\[\033[35m\]$"
    local __last_color="\[\033[00m\]"
    export PS1="$__user_and_host $__cur_location $__git_branch_color$__git_branch$__prompt_tail$__last_color \n"
}

color_my_prompt
