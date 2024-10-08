# for GNU ls command on Mac OS
if [[ $OSTYPE == darwin* ]]; then
  alias ls='gls --color=auto'
  alias la='gls --color=auto -a'
  alias ll='gls --color=auto -lh'
  alias dirs='dirs -v'
  eval `gdircolors ~/.dir_colors`
fi

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  if [[ -x "$(command -v xclip)" ]]; then
    alias pbcopy="xclip -sel clip"
    alias pbpaste="xclip -out -sel clip"
  fi
fi

# "..", "...", "...." for easier navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias cdl="clear && cd"

# sane latex behaviour
alias latex="latex -interaction=nonstopmode"

# git dotfiles config
alias dots='/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME'
alias dotss="dots status"
alias dotsc="dots commit"
alias dotsa="dots add"
alias dotsd="dots diff"
alias dotsf="dots fetch"
alias dotsg="dots merge"
alias dotsdd="dots diff --staged"
alias dotsl="dots log"

alias gdd="git diff --staged"
alias grss="git restore --staged"

alias gl="git log"
alias gf="git fix"
alias gr="git rebase"
alias gra="git rebase --abort"
alias grc="git rebase --continue"

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  alias identity="/usr/bin/flatpak run --file-forwarding org.gnome.gitlab.YaLTeR.Identity @@"
  alias gimp="/usr/bin/flatpak run --branch=stable --arch=x86_64 --command=gimp-2.10 --file-forwarding org.gimp.GIMP @@"
fi

# make less have pretty colors
export LESS="--RAW-CONTROL-CHARS"
[[ -f $XDG_CONFIG_HOME/less_termcap ]] && . $XDG_CONFIG_HOME/less_termcap

# some random aliases
alias gen_hash="$ZSH/custom/node gen_hash"
alias gs="git status"
alias gitstat='git log --shortstat | awk "/^ [0-9]/ { f += \$1; i += \$4; d+= \$6 } END { printf(\"%d files changed, %d insertions(+), %d deletions(-)\n\", f, i, d) }"'

# battery stuff on Mac OS
if [[ $OSTYPE == darwin* ]]; then
  alias battsrc="pmset -g batt | grep -Eo \"'(.*)'\" | grep --color=never -Eo \"([^']+)\""
  alias batt="pmset -g batt | grep --color=never -Eo '([0-9]{1,3})%'"
  alias battery='echo "$(battsrc): $(batt)"'
fi

# json stuff
alias pp_json='xargs -0 node -e "console.log(JSON.stringify(JSON.parse(process.argv[1]), null, 4));"'
alias is_json='xargs -0 node -e "try {json = JSON.parse(process.argv[1]);} catch (e) { console.log(false); json = null; } if(json) { console.log(true); }"'
alias urlencode_json='xargs -0 node -e "console.log(encodeURIComponent(process.argv[1]))"'
alias urldecode_json='xargs -0 node -e "console.log(decodeURIComponent(process.argv[1]))"'

# special aliases on Mac OS
if [[ $OSTYPE == darwin* ]]; then
  # typora
  alias typora="open -a typora"
  # subl
  alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
fi

# enforcing $XDG_CONFIG_HOME and similar
export ATOM_HOME="$XDG_DATA_HOME/atom"
export SQLITE_HISTORY="$XDG_DATA_HOME/sqlite_history"
export VIMINIT="source $XDG_CONFIG_HOME/vim/vimrc"


alias sqlite3="sqlite3 -init \"$XDG_CONFIG_HOME/sqlite3/sqliterc\""
alias mc="mc --config-dir \"$XDG_CONFIG_HOME/mc\""
alias tmux="tmux -f \"$XDG_CONFIG_HOME/tmux/tmux.conf\""

# don't ask
alias unix="curl -sL https://git.io/unix | cat"

alias mm="micromamba"

alias d="docker"
alias dc="docker-compose"

# fixing $TERM for ssh since host might not know the specific terminal being used (i.e. alacritty)
alias ssh="TERM=xterm-256color ssh"
