#!/bin/bash

# XDG paths
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"

# Add local scripts to path
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH"

# zsh configuration directory
export ZDOTDIR=$XDG_CONFIG_HOME/zsh

# Antigen cache directory
export ADOTDIR=$XDG_CACHE_HOME/antigen

# Locale settings
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Programs
export EDITOR="nvim"
export BROWSER="chromium"
export TERMINAL="alacritty"
export FILE_MANAGER="lf"

# Icons for LF
LF_ICONS=$(sed ~/.config/diricons \
        -e 's/[ \t]\+/=/g'     \
        -e 's/$/ /')
LF_ICONS=${LF_ICONS//$'\n'/:}
export LF_ICONS

# Start X session
# exec startx
[[ -z "$SSH_CLIENT" ]] && [[ -z "$SSH_TTY" ]] && exec startx
