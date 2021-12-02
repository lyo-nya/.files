#!/bin/zsh

# Prompts
SPACESHIP_PROMPT_ORDER=(user host dir venv char)
SPACESHIP_RPROMPT_ORDER=(git exec_time vi_mode)

# Disable newline
SPACESHIP_PROMPT_ADD_NEWLINE=false

# User
SPACESHIP_USER_SHOW=always
SPACESHIP_USER_SUFFIX="%F{yellow}@%f"
SPACESHIP_USER_COLOR="026"
SPACESHIP_USER_ROOT_COLOR="026"

# Host
SPACESHIP_HOST_SHOW=always
SPACESHIP_HOST_PREFIX=""
SPACESHIP_HOST_COLOR=red
SPACESHIP_HOST_COLOR_SSH=red

# Dir
SPACESHIP_DIR_PREFIX=""
SPACESHIP_DIR_TRUNC=1
SPACESHIP_DIR_COLOR="240"

# Venv
SPACESHIP_VENV_PREFIX=""
SPACESHIP_VENV_GENERIC_NAMES=()

# Char
SPACESHIP_CHAR_SYMBOL="⮞ "

# Git
SPACESHIP_GIT_PREFIX=""

# Time
SPACESHIP_EXEC_TIME_PREFIX=""

# VI-mode
SPACESHIP_VI_MODE_INSERT="%F{green}■ %f"
SPACESHIP_VI_MODE_NORMAL="%F{blue}■ %f"

# Snippet form https://github.com/spaceship-prompt/spaceship-prompt/issues/426
# Changes bold style to regular for prompt
() {
  local z=$'\0'
  PROMPT='${${${$(spaceship_prompt)//\%\%/'$z'}//\%B}//'$z'/%%}'
  RPROMPT='${${${$(spaceship_rprompt)//\%\%/'$z'}//\%B}//'$z'/%%}'
}
