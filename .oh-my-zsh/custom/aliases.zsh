# Aliases

# "..", "...", "...." for easier navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# sane latex behaviour
alias latex="latex -interaction=nonstopmode"

# git dotfiles config
alias dots='/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME'

alias dotss="dots status"

alias dotsc="dots commit --verbose"
alias dotsa="dots add"
alias dotsf="dots fix"

alias dotsd="dots diff"
alias dotsdd="dots diff --staged"
alias dotsl="dots log"


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

alias gco='git checkout'
alias gb='git branch'
alias gr='git rebase'
alias gra='git rebase --abort'
alias grc='git rebase --continue'

# make less have pretty colors
export LESS="--RAW-CONTROL-CHARS"
[[ -f $XDG_CONFIG_HOME/less_termcap ]] && . $XDG_CONFIG_HOME/less_termcap

# enforcing $XDG_CONFIG_HOME and similar
export SQLITE_HISTORY="$XDG_DATA_HOME/sqlite_history"
export VIMINIT="source $XDG_CONFIG_HOME/vim/vimrc"

alias sqlite3="sqlite3 -init \"$XDG_CONFIG_HOME/sqlite3/sqliterc\""
alias mc="mc --config-dir \"$XDG_CONFIG_HOME/mc\""
alias tmux="tmux -f \"$XDG_CONFIG_HOME/tmux/tmux.conf\""

alias mm="micromamba"

alias d="docker"
alias dc="docker-compose"

# fixing $TERM for ssh since host might not know the specific terminal being used (i.e. alacritty)
alias ssh="TERM=xterm-256color ssh"

# show "files changed, insertions, deletions" info based on git log
alias gitstat='git log --shortstat | awk "/^ [0-9]/ { f += \$1; i += \$4; d+= \$6 } END { printf(\"%d files changed, %d insertions(+), %d deletions(-)\n\", f, i, d) }"'
