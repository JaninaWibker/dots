# λ ∆ 🦄 😊 😭 😱 🙈 🔥
local rs_symbol="λ"
local rs_true="%{$fg_bold[green]$rs_symbol%}"
local rs_false="%{$fg_bold[white]$FG[088]$rs_symbol%}"
local ret_status="%(?:%{$rs_true%}:%{$rs_false%}) "

PROMPT='${ret_status}%{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg_bold[red]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
