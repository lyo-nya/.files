#!/bin/zsh

# Allow aliases to work with sudo
alias sudo='sudo '

alias luamake=$XDG_DATA_HOME/lua-language-server/3rd/luamake/luamake
alias vi=nvim
alias config="/usr/bin/git --git-dir=$HOME/.files/ --work-tree=$HOME"

# LS
alias ls="exa --icons --group-directories-first"
alias la="ls -a"
alias ll="la -l"

# Venv
alias mkenv="python3 -m venv"

function activate {
    source $1/bin/activate
}

