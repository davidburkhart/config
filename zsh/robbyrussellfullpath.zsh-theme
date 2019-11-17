if [[ -z "$SSH_CLIENT" ]]; then
  prompt_host=""
else
  prompt_host="%{$fg[magenta]%}($(hostname -s)) "
fi

local is_root="%(!.%{$fg[red]%}[root] .)"
local ret_status="%(?:%{$fg_bold[green]%}➜:%{$fg_bold[red]%}➜ %?)"
PROMPT='${ret_status} ${is_root}${prompt_host}%{$fg[cyan]%}%~%{$reset_color%} '
#PROMPT='${ret_status} ${is_root}${prompt_host}%{$fg[cyan]%}%~%{$reset_color%} $(git_prompt_info)'

#ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
#ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}) "
#ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
#ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
