# file source by main.zsh

# not every single config option that is linux specific has to go here, if it makes sense
# to put them somewhere else (e.g. if there is the same thing being done for both linux and macOS, it makes sense to not split that up into two files)

export BROWSER="/usr/bin/vivaldi"

# replicate macOS pbcopy and pbpaste utilities using xclip
# not a perfect replication, but good enough for the simple case of copying and pasting text,
# lacks support for images, and probably some other things as well
if [[ -x "$(command -v xclip)" ]]; then
  alias pbcopy="xclip -sel clip"
  alias pbpaste="xclip -out -sel clip"
fi
