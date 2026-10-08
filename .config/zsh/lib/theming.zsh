# expand variables and command substitutions in $PROMPT
setopt prompt_subst

# $LS_COLORS for ls and completion, prefers GNU dircolors from coreutils on macOS
function {
  local dircolors=${commands[gdircolors]:-$commands[dircolors]}
  [[ -n $dircolors ]] || return
  if [[ -f ~/.dir_colors ]]; then
    eval "$($dircolors -b ~/.dir_colors)"
  else
    eval "$($dircolors -b)"
  fi
}
