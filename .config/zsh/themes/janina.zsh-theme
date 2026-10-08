autoload -Uz \
  add-zle-hook-widget \
  add-zsh-hook

# styling:
# - λ in insert mode
# - ∆ in normal mode
# - green if last command succeeded
# - red if last command failed
# colors only use zsh's own prompt sequences (%B/%b bold, %F{...}/%f color), so zsh always knows
# which colors are active and how wide the prompt is (no %{...%} needed)

_theme_success="%F{green}"
_theme_failure="%F{88}"
_theme_mode="" # populated by _theme_precmd and _theme_vi_mode
_theme_git="" # populated by _theme_precmd

# $PROMPT is re-evaluated every render
# single quotes so that zsh can evaluate it whenever necessary
PROMPT=''
PROMPT+='%B%(?.${_theme_success}.${_theme_failure})' # red/green
PROMPT+='$_theme_mode%f' # λ/∆
PROMPT+=' %F{cyan}%c%f%b' # current directory
PROMPT+=' $_theme_git'

ZSH_THEME_GIT_PROMPT_PREFIX='%B%F{blue}(%F{red}'
ZSH_THEME_GIT_PROMPT_SUFFIX='%f%b '
ZSH_THEME_GIT_PROMPT_DIRTY='%F{blue}) %F{red}✗'
ZSH_THEME_GIT_PROMPT_CLEAN='%F{blue})'

typeset -A ZSH_HIGHLIGHT_STYLES

ZSH_HIGHLIGHT_STYLES[command]=none
ZSH_HIGHLIGHT_STYLES[unknown-token]=none
ZSH_HIGHLIGHT_STYLES[path]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[builtin]=none
ZSH_HIGHLIGHT_STYLES[alias]=none
ZSH_HIGHLIGHT_STYLES[function]=none
ZSH_HIGHLIGHT_STYLES[precommand]=fg=white,underline
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=red
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=red

function _theme_precmd {
  _theme_mode="λ" # always starts out in insert mode
  _theme_git="$(git_prompt_info)"
}

function _theme_vi_mode {
  case $KEYMAP in
    vicmd)      _theme_mode="∆" ;;
    viins|main) _theme_mode="λ" ;;
    vivis)      _theme_mode="V" ;; # doesn't work, see https://stackoverflow.com/questions/39871079/detect-zsh-keymap-mode-for-vi-visual-mode
  esac

  zle reset-prompt
}

add-zsh-hook precmd _theme_precmd
add-zle-hook-widget keymap-select _theme_vi_mode
