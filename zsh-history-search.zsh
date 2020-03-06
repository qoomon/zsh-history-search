
function _history_search_widget {

  local BUFFER_ORIGIN=${BUFFER}
  local CURSOR_ORIGIN=${CURSOR}

  BUFFER=''
  zle -Rc
  echo -n "${fg_bold[magenta]}…${reset_color}"

  local query=${BUFFER_ORIGIN} # whole command

  local cmd=$(history -n 0 | \
      fzf --height 10 --reverse --tac --exact --no-sort --query=${query} --select-1)

  if [ -n ${cmd} ]; then
    BUFFER="${cmd}"
    CURSOR=${#BUFFER}
  else
    BUFFER=${BUFFER_ORIGIN}
    CURSOR=${CURSOR_ORIGIN}
  fi

  zle redisplay
}

HISTORY_ARGUMENT_SEARCH_LIMIT=1000 # default

function _history_search_argument_widget {

  BUFFER_ORIGIN=${BUFFER}
  CURSOR_ORIGIN=${CURSOR}
  LBUFFER_ORIGIN=${LBUFFER}
  RBUFFER_ORIGIN=${RBUFFER}

  BUFFER=''
  zle -Rc
  echo -n "${LBUFFER_ORIGIN%${query}}${fg_bold[magenta]}…${reset_color}${RBUFFER_ORIGIN}"

  local query=${${${(z)${:-_ ${LBUFFER_ORIGIN}}}[-1]}#_} # left cursor side argument
  if [[ ${LBUFFER_ORIGIN} == *' ' ]] && [[ ! ${query} == *' ' ]]; then
    query=''
  fi

  local argument=$(history -n 0 | tail -n $HISTORY_ARGUMENT_SEARCH_LIMIT | (while read line; do echo ${(j:\n:)${(z)line}}; done) | nl | sort -rk2 | sort -uk2 | sort -nk1 | cut -f2- | \
      fzf --height 10 --reverse --tac --exact --no-sort --query=${query} --select-1)   

  if [ -n ${argumen} ]; then
    BUFFER="${LBUFFER_ORIGIN%$query}${argument}${RBUFFER_ORIGIN}"
    CURSOR=${#${:-"${LBUFFER_ORIGIN%${query}}${argument}"}}
  else
    BUFFER=${BUFFER_ORIGIN}
    CURSOR=${CURSOR_ORIGIN}
  fi

  zle redisplay
}

# Key Bindings #################################################################

if [ $commands[fzf] ]; then
  zle -N _history_search_widget
  # bind ctrl + r
  bindkey '^R' _history_search_widget 
  
  zle -N _history_search_argument_widget
  # bind ctrl + space
  bindkey '^@' _history_search_argument_widget 
fi