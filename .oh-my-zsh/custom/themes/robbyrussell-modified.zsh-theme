# λ ∆
local rs_symbol="λ"
local rs_true="%{$fg_bold[green]$rs_symbol%}"
local rs_false="%{$fg_bold[white]$FG[088]$rs_symbol%}"
local ret_status="%(?:%{$rs_true%}:%{$rs_false%}) "

PROMPT='${ret_status}%{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg_bold[red]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

function zle-line-init zle-keymap-select {
    local mode=""
    case $KEYMAP in
      vicmd)      mode="∆" ;;
      viins|main) mode="λ" ;;
      vivis)      mode="V" ;; # incase I add have a solution for [this](https://stackoverflow.com/questions/39871079/detect-zsh-keymap-mode-for-vi-visual-mode) at some point
    esac

    local rs_true="%{$fg_bold[green]$mode%}"
    local rs_false="%{$fg_bold[white]$FG[088]$mode%}"
    local ret_status="%(?:%{$rs_true%}:%{$rs_false%}) "

    PROMPT='${ret_status}%{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'

    ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}(%{$fg[red]%}"
    ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
    ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg_bold[red]%}✗"
    ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

    zle reset-prompt

}
zle -N zle-line-init
zle -N zle-keymap-select

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down
bindkey "^w" backward-kill-word # Delete word

bindkey -M vicmd "^V" edit-command-line

bindkey '^[[Z' reverse-menu-complete # Shift-Tab support for auto completion

