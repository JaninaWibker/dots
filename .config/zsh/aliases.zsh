# Aliases

# "..", "...", "...." for easier navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -lh'

alias dirs='dirs -v'

alias grep='grep --color=auto --exclude-dir=.git'
alias diff='diff --color=auto'

# sane latex behaviour
alias latex="latex -interaction=nonstopmode"

# git dotfiles config
alias dots='git --git-dir=$HOME/.cfg --work-tree=$HOME'

alias dotss="dots status"

alias dotsc="dots commit --verbose"
alias dotsa="dots add"
alias dotsf="dots fix"

alias dotsd="dots diff"
alias dotsdd="dots diff --staged"
alias dotsl="dots log"

alias ldots="lazygit --git-dir $HOME/.cfg --work-tree $HOME"

# git aliases
alias g="git"

alias gs='git status'
alias gss='git status --short'

alias gc='git commit --verbose'
alias ga='git add'
alias grss='git restore --staged'
alias gf='git fix'
alias gft='git fixto'

alias gd='git diff'
alias gdd='git diff --staged'
alias gl='git log'
alias gll='git statlog'
alias glf='git statlogfull'

alias gco='git checkout'
alias gb='git branch'
alias gr='git rebase'
alias gra='git rebase --abort'
alias grc='git rebase --continue'

alias lg="lazygit"

# make less have pretty colors
export PAGER="less"
export LESS="--RAW-CONTROL-CHARS"
[[ -f $XDG_CONFIG_HOME/less_termcap ]] && . $XDG_CONFIG_HOME/less_termcap

# jq colors
# it's a shame the field color cannot be set (would have set it to 0;38 or something like that)
export JQ_COLORS="0;37:0;33:0;33:0;36:0;35:0;37:0;37"

# enforcing $XDG_CONFIG_HOME and similar
export SQLITE_HISTORY="$XDG_DATA_HOME/sqlite_history"
export VIMINIT="source $XDG_CONFIG_HOME/vim/vimrc"

alias sqlite3="sqlite3 -init \"$XDG_CONFIG_HOME/sqlite3/sqliterc\""
alias tmux="tmux -f \"$XDG_CONFIG_HOME/tmux/tmux.conf\""

alias d="docker"
alias dc="docker compose"

# fixing $TERM for ssh since host might not know the specific terminal being used (i.e. alacritty)
alias ssh="TERM=xterm-256color ssh"
