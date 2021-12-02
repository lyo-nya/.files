#!/bin/zsh

# Extract directory, where this script lives
PLUGINS_DIR=$(dirname "$0")

# Set directory, where antigen source files are stored
ANTIGEN_PATH=$XDG_DATA_HOME/antigen

# If that directory does not exist, create
[[ -d $ANTIGEN_PATH ]] || mkdir -p $ANTIGEN_PATH

# If there is no antigen cache folder, prompt user to connect to wifi using bash
! [[ -d $ADOTDIR ]] && echo "Connect to wifi and then exit shell (type exit)" && bash

# Download antigen
[[ ! -f $ANTIGEN_PATH/antigen.zsh ]] &&
    mkdir -p $ANTIGEN_PATH &&
    curl -L git.io/antigen > $ANTIGEN_PATH/antigen.zsh 

# ``Install'' antigen
source $ANTIGEN_PATH/antigen.zsh

# Source plugins setup script
source $PLUGINS_DIR/antigen.zsh

# Source plugin configurations
source $PLUGINS_DIR/spaceship.zsh
source $PLUGINS_DIR/zsh-vi-mode.zsh
source $PLUGINS_DIR/zsh-autosuggestions.zsh
