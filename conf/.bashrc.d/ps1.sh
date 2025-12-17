RESET_ESCAPE="\e[0m"
RED_ESCAPE="\e[91m"
GREEN_ESCAPE="\e[92m"
BLUE_ESCAPE="\e[94m"
MAGENTA_ESCAPE="\e[95m"
CYAN_ESCAPE="\e[96m"
WHITE_ESCAPE="\e[97m"

get_user() {
  local luser=$(whoami)
  echo -e "$RED_ESCAPE$luser$RESET_ESCAPE"
}

get_hostname() {
  local lhostname=$(hostname)
  echo -e "$CYAN_ESCAPE$lhostname$RESET_ESCAPE"
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
  local ld=$(get_curdir)
  echo -e "$lc$lu$WHITE_ESCAPE@$lh $ld $GREEN_ESCAPE\$$RESET_ESCAPE "
}

export PS1='$(get_ps1)'
