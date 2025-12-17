RESET_ESCAPE="\e[0m"
RED_ESCAPE="\e[91m"
GREEN_ESCAPE="\e[92m"
YELLOW_ESCAPE="\e[93m"
BLUE_ESCAPE="\e[94m"
MAGENTA_ESCAPE="\e[95m"
CYAN_ESCAPE="\e[96m"
WHITE_ESCAPE="\e[97m"

get_user() {
  local usr="$(whoami 2>/dev/null)"
  if [ "$usr" == "" ]; then
    usr="undefined_user"
  fi
  echo "$usr"
}

get_curdir() {
  local curdir="$(pwd 2>/dev/null)"
  if [ "$curdir" == "" ]; then
    lcurdir="undefined_dir"
  elif [ "$curdir" == "$HOME" ]; then
    curdir="~"
  else
    curdir="$(echo "$curdir" | rev | cut -d'/' -f 1 | rev)"
  fi
  echo "$curdir"
}

get_ps1() {
  local usr dir branch time cols spaces
  usr="$(get_user)"
  dir="$(get_curdir)"
  time="$(date +%H:%M)"
  cols=$(tput cols)
  spaces=$(( cols - ${#usr} - ${#dir} - ${#branch} - ${#time} - 1 ))
  printf '%b%s%b@%s%*s%b%s\n%b$ %b' \
    "$CYAN_ESCAPE" "$usr" "$WHITE_ESCAPE" "$dir" \
    "$spaces" "" \
    "$YELLOW_ESCAPE" "$time" \
    "$GREEN_ESCAPE" "$RESET_ESCAPE"
}

export PS1="$(get_ps1)"
