# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# if you want to use some bin program, adds the path and
# 'uncomment' the following line:
# export PATH="$HOME/path/to/bin:$PATH"

# this will toggle on the colors when ls command
alias ls='ls --color=auto'

RESET_ESCAPE="\e[0m"
RED_ESCAPE="\e[1;91m"
GREEN_ESCAPE="\e[1;92m"
YELLOW_ESCAPE="\e[1;93m"
MAGENTA_ESCAPE="\e[1;95m"
CYAN_ESCAPE="\e[1;96m"
WHITE_ESCAPE="\e[1;97m"

get_user_name() {
  echo -e "${GREEN_ESCAPE}$(whoami)"
}

get_cur_dir() {
  local curdir=$(pwd)
  if [ "$curdir" == "$HOME" ]; then
    curdir="~"
  else
    curdir=$(pwd | rev | cut -d'/' -f 1 | rev)
  fi
  echo -e "${MAGENTA_ESCAPE}$curdir"
}

get_branch() {
  local curbranch=$(git branch 2> /dev/null | grep '*' | sed 's/* /*/')
  if [ -z $curbranch ]; then
    curbranch="?"
  else
    curbranch="${CYAN_ESCAPE}$curbranch${YELLOW_ESCAPE}"
  fi
  echo -e "${YELLOW_ESCAPE}git:($curbranch)"
}

get_pre_prompt() {
  echo -e "${WHITE_ESCAPE}[\$(get_user_name)${WHITE_ESCAPE}.\$(get_cur_dir) \$(get_branch)${WHITE_ESCAPE}] \$${RESET_ESCAPE}"
}

export PS1="$(get_pre_prompt) "
