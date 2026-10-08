# not every single config option that is macOS specific has to go here, if it makes sense
# to put them somewhere else (e.g. if there is the same thing being done for both linux and macOS, it makes sense to not split that up into two files)

# replace built-in ls with GNU ls (from coreutils) if installed
if (( $+commands[gls] )); then
  alias ls='gls --color=auto'
fi

export LANG=en_US.UTF-8

function cdf() {
  cd "`osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)'`" # cd's to the folder currently opened in finder
}
