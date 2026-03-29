### mixture of vi and emacs keybinds
bindkey -v
export KEYTIMEOUT=1 # 0.1s
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^h' backward-delete-char
bindkey "^?" backward-delete-char
bindkey '^w' backward-kill-word # just can't live without w, a and e emacs shortcuts tbh
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey '^b' backward-char
bindkey '^f' forward-char

bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down
bindkey "^w" backward-kill-word # Delete word

bindkey -M vicmd "^V" edit-command-line

bindkey '^[[Z' reverse-menu-complete # Shift-Tab support for auto completion

bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

bindkey "^[[1;5C" end-of-line
bindkey "^[[1;5D" beginning-of-line


### Folders
export PRJ="${HOME}/Desktop/projects"

### JQ COLORS
# it's a shame the field color cannot be set (would have set it to 0;38 or something like that)
export JQ_COLORS="0;37:0;33:0;33:0;36:0;35:0;37:0;37"

# in case .profile does not set the editor correctly
export EDITOR="/usr/bin/vim"

# incase .profile does not set these correctly
export HIGH_DPI=1
export THEME_VARIANT="dark"

typeset -A ZSH_HIGHLIGHT_STYLES

ZSH_HIGHLIGHT_STYLES[command]=none
ZSH_HIGHLIGHT_STYLES[unknown-token]=none
ZSH_HIGHLIGHT_STYLES[path]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[builtin]=none
ZSH_HIGHLIGHT_STYLES[alias]=none
ZSH_HIGHLIGHT_STYLES[function]=none
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=cyan
ZSH_HIGHLIGHT_STYLES[precommand]=fg=white,underline
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=red
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=red

# activate direnv
eval "$(direnv hook zsh)"

if [[ $OSTYPE == darwin* ]]; then
  . $ZSH_CUSTOM/macos.zsh
elif [[ $OSTYPE == linux-gnu ]]; then
  . $ZSH_CUSTOM/linux.zsh
fi
