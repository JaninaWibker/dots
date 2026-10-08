# terminal title: the running command (e.g. vim) while it runs, "zsh" at the prompt

autoload -Uz add-zsh-hook

function _termsupport_title_precmd {
  print -n '\e]2;zsh\a'
}

function _termsupport_title_preexec {
  setopt localoptions extendedglob
  # first word which isn't a variable assignment, sudo or an option, e.g. "sudo -E vim foo" -> vim
  print -rn -- $'\e]2;'"${1[(wr)^(*=*|sudo|-*)]}"$'\a'
}

add-zsh-hook precmd _termsupport_title_precmd
add-zsh-hook preexec _termsupport_title_preexec
