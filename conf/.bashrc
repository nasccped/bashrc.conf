# if you want to use some bin program, adds the path and
# 'uncomment' the following line:
# export PATH="$HOME/path/to/bin:$PATH"

# this will toggle on the colors when ls command
alias ls='ls --color=auto'

RESET_ESCAPE="\e[0m"
RED_ESCAPE="\e[1;38;5;203m"
GREEN_ESCAPE="\e[1;38;5;156m"
BLUE_ESCAPE="\e[1;38;5;159m"
MAGENTA_ESCAPE="\e[1;38;5;218m"
WHITE_ESCAPE="\e[1;97m"

reset_cursor() {
  # this cursor-shape in the underline blinking one
  # I can set your prefered (search for cursor shape escapes)
  local prefered_cursor="\e[3 q"
  echo -e "$prefered_cursor"
}

get_user() {
  local luser=$(whoami)
  echo -e "$RED_ESCAPE$luser$RESET_ESCAPE"
}

get_hostname() {
  local lhostname=$(hostname)
  echo -e "$BLUE_ESCAPE$lhostname$RESET_ESCAPE"
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
  local lc=$(reset_cursor)
  local lu=$(get_user)
  local lh=$(get_hostname)
  local ld=$(get_curdir)
  echo -e "$lc$lu$WHITE_ESCAPE@$lh $ld $GREEN_ESCAPE\$$RESET_ESCAPE "
}

PS1='$(get_ps1)'

