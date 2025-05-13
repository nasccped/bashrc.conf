# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# if you want to use some bin program, adds the path and
# 'uncomment' the following line:
# export PATH="$HOME/path/to/bin:$PATH"

# this will toggle on the colors when ls command
alias ls='ls --color=auto'

RESET_ESCAPE="\e[0m"
GREEN_ESCAPE="\e[1;92m"
YELLOW_ESCAPE="\e[1;93m"
BLUE_ESCAPE="\e[1;94m"
CYAN_ESCAPE="\e[1;96m"
WHITE_ESCAPE="\e[1;97m"

get_user_name() {
  echo -e "${GREEN_ESCAPE}$(whoami)${RESET_ESCAPE}"
}

get_cur_dir() {
  local curdir=$(pwd)
  if [ "$curdir" == "$HOME" ]; then
    curdir="~"
  else
    curdir=$(pwd | rev | cut -d'/' -f 1 | rev)
  fi
  echo -e "${BLUE_ESCAPE}$curdir${RESET_ESCAPE}"
}

get_branch() {
  local curbranch=$(git branch 2> /dev/null | grep '*' | sed 's/* /*/')
  if [ -z $curbranch ]; then
    curbranch="?"
  else
    curbranch="${CYAN_ESCAPE}$curbranch${RESET_ESCAPE}"
  fi
  local gitbranch="${YELLOW_ESCAPE}git:($curbranch${YELLOW_ESCAPE})${RESET_ESCAPE}"
  echo -e "$gitbranch"
}

get_ps1() {
  local luser=$(get_user_name)
  local ldir=$(get_cur_dir)
  # local lbranch=$(get_branch) this won't work
  echo -e "${WHITE_ESCAPE}[$luser${WHITE_ESCAPE}.$ldir \$(get_branch)${WHITE_ESCAPE}]\$${RESET_ESCAPE}"
}

export PS1="$(get_ps1) "
