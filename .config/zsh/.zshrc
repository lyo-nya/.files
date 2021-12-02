#!/bin/zsh

# Create cache directory if it does not exist
[[ -d $XDG_CACHE_HOME/zsh ]] || mkdir $XDG_CACHE_HOME/zsh

# Some history settings
export HISTFILE=$XDG_CACHE_HOME/zsh/history
export HISTSIZE=50000
export SAVEHIST=10000
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS

# Plugins setup
source $ZDOTDIR/plugins/init.zsh

# Aliases
source $ZDOTDIR/aliases.zsh
