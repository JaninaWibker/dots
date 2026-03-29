# file source by main.zsh

# not every single config option that is macOS specific has to go here, if it makes sense
# to put them somewhere else (e.g. if there is the same thing being done for both linux and macOS, it makes sense to not split that up into two files)

# replace built-in ls with GNU ls
alias ls='gls --color=auto'
alias la='gls --color=auto -a'
alias ll='gls --color=auto -lh'
alias dirs='dirs -v'
eval `gdircolors ~/.dir_colors`

export PATH="$PATH:/Applications/Inkscape.app/Contents/MacOS/"
export BROWSER="'/Applications/Google Chrome.app/Contents/MacOS/Google Chrome'"
export LANG=en_US.UTF-8

function cdf() {  # short for cdfinder
  cd "`osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)'`" # cd's to the folder currently opened in finder
}

# battery
alias battsrc="pmset -g batt | grep -Eo \"'(.*)'\" | grep --color=never -Eo \"([^']+)\""
alias batt="pmset -g batt | grep --color=never -Eo '([0-9]{1,3})%'"
alias battery='echo "$(battsrc): $(batt)"'

# volume control using osacript
function vol() {
  bold=$(tput bold)
  reset=$(tput sgr0)
  orange=$(tput setaf 172)
  purple=$(tput setaf 141)
  if [ $# -eq 0 ]; then
    echo "${bold}Usage${reset}"
    echo "  ${bold}${orange}-${reset} vol [${bold}1${reset}-${bold}10${reset}]${reset}    // this sets the volume to the specified level"
    echo "  ${bold}${orange}-${reset} vol ${bold}mute ${reset}     // this mutes the volume"
    echo "  ${bold}${orange}-${reset} vol ${bold}unmute ${reset}   // this unmutes the volume"
  elif [ $1 = "mute" ]; then
    osascript -e "set volume output muted true";
  elif [ $1 = "unmute" ]; then
    osascript -e "set volume output muted false";
  else
    osascript -e "set volume ${1}"
  fi
}
