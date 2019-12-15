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
#PROMPT='${ret_status} ${is_root}${prompt_host}%{$fg[cyan]%}%~%{$reset_color%} $(git_prompt_info)'

#ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
#ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}) "
#ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
#ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
