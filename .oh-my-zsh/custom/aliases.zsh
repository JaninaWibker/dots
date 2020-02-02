# for GNU ls command on Mac OS
if [[ "$OSTYPE" == "darwin" ]]; then
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

# git dotfiles config
alias dots='/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME'
alias dotss="dots status"
alias dotsc="dots commit"
alias dotsa="dots add"
alias dotsd="dots diff"
alias dotsf="dots fetch"
alias dotsg="dots merge"
alias dotsdd="dots diff --staged"

alias gdd="git diff --staged"

# some random aliases
alias c="pygmentize -O style=solarizeddark -f console256 -g"
alias gen_hash="$ZSH/custom/node gen_hash"
alias gs="git status"
alias gitstat='git log --shortstat | awk "/^ [0-9]/ { f += \$1; i += \$4; d+= \$6 } END { printf(\"%d files changed, %d insertions(+), %d deletions(-)\n\", f, i, d) }"'
alias sp="$HOME/programs/sp/sp"

# battery stuff on Mac OS
if [[ "$OSTYPE" == "darwin" ]]; then
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
if [[ "$OSTYPE" == "darwin" ]]; then
  # typora
  alias typora="open -a typora"
  # subl
  alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
  # list network interfaces
  alias interfaces="networksetup -listallhardwareports" 
fi

export NODE_ICU_DATA=/usr/local/lib/node_modules/full-icu

function lolban() {
  if [[ -x "$(command -v toilet)" ]] && [[ "$(command -v lolcat)" ]]; then
    toilet -d $HOME/programs/toilet/fonts -f 3d "$1" | lolcat
  fi
}

# don't ask
alias unix="curl -sL https://git.io/unix | cat"
