_command_time_preexec() {
  timer=${SECONDS}
  export ZSH_COMMAND_TIME_MSG=""
}

_command_time_precmd() {
  if [ -n "$timer" ] &&  [ "$timer" -gt 2 ]; then
    timer=$(($SECONDS - $timer))
    if [ "$timer" -gt 2 ]; then
      hours=$(($timer/3600))
      min=$(($timer/60))
      sec=$(($timer%60))
      if [ "$timer" -le 60 ]; then
          timer_show="%{$fg[yellow]%}${timer}s"
      elif [ "$timer" -gt 60 ] && [ "$timer" -le 180 ]; then
          timer_show="%{$fg[yellow]%}${min}min ${sec}s"
      else
          if [ "$hours" -gt 0 ]; then
              min=$(($min%60))
              timer_show="$fg[red]${hours}h ${min}min ${sec}s"
          else
              timer_show="$fg[red]${min}min ${sec}s"
          fi
      fi
      export ZSH_COMMAND_TIME_MSG="$timer_show"
      unset timer
      unset timer_show
    fi
  fi
}

precmd_functions+=(_command_time_precmd)
preexec_functions+=(_command_time_preexec)

function is_ssh() {
  p=${1:-$PPID}
  read pid name x ppid y < <( cat /proc/$p/stat )
  # or: read pid name ppid < <(ps -o pid= -o comm= -o ppid= -p $p)
  [[ "$name" =~ sshd ]] && { return 0; }
  [ "$ppid" -le 1 ]     && { return 1; }
  is_ssh $ppid
}

if is_ssh; then
  prompt_host="%{$fg[magenta]%}($(hostname -s)) "
else
  prompt_host=""
fi

local is_root="%(!.%{$fg[red]%}[root] .)"
local ret_status="%(?:%{$fg_bold[green]%}➜:%{$fg_bold[red]%}➜ %?)"
PROMPT='${ret_status} ${is_root}${prompt_host}%{$fg[cyan]%}%~%{$reset_color%} '
#PROMPT='${ret_status} ${is_root}${prompt_host}%{$fg[cyan]%}%~%{$reset_color%} $(git_prompt_info) '
RPROMPT+=" %{$fg[black]%}%{$bg[white]%}%*%{$reset_color%}"
RPROMPT="\$ZSH_COMMAND_TIME_MSG $RPROMPT"
#ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
#ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}) "
#ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
#ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
