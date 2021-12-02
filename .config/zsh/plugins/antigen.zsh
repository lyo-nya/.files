#!/bin/zsh

# Antigen
ANTIGEN_AUTO_CONFIG=false

antigen use oh-my-zsh
antigen bundle git
antigen bundle archlinux
antigen bundle djui/alias-tips
antigen bundle jeffreytse/zsh-vi-mode
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen theme spaceship-prompt/spaceship-prompt

antigen apply
