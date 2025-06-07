# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# if you want to use some bin program, adds the path and
# 'uncomment' the following line:
# export PATH="$HOME/path/to/bin:$PATH"

# this will toggle on the colors when ls command
alias ls='ls --color=auto'

RESET_ESCAPE="\e[0m"
RED_ESCAPE="\e[1;38;5;203m"
GREEN_ESCAPE="\e[1;38;5;156m"
BLUE_ESCAPE="\e[1;38;5;153m"
MAGENTA_ESCAPE="\e[1;38;5;218m"
WHITE_ESCAPE="\e[1;97m"

get_user() {
  local luser=$(whoami)
  echo -e "$BLUE_ESCAPE$luser$RESET_ESCAPE"
}

get_hostname() {
  local lhostname=$(hostname)
  echo -e "$RED_ESCAPE$lhostname$RESET_ESCAPE"
}

get_curdir() {
  local lcurdir=$(pwd)
  if [ "$lcurdir" == $HOME ]; then
    lcurdir="~"
  else
    lcurdir=$(echo $lcurdir | rev | cut -d'/' -f 1 | rev)
  fi
  echo -e "$MAGENTA_ESCAPE$lcurdir$RESET_ESCAPE"
}

get_ps1() {
  local lu=$(get_user)
  local lh=$(get_hostname)
  local lc=$(get_curdir)
  echo -e "$lh$WHITE_ESCAPE@$lu $lc $GREEN_ESCAPE\$$RESET_ESCAPE "
}

PS1='$(get_ps1)'

