# zsh defaults to no history file at all and only 30 entries in memory
HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000
SAVEHIST=$HISTSIZE

setopt extended_history        # record timestamp of command in HISTFILE
setopt hist_reduce_blanks      # remove superfluous blanks before saving
setopt hist_ignore_dups        # ignore duplicated commands history list
setopt hist_ignore_space       # ignore commands that start with space
setopt hist_verify             # show command with history expansion to user before running it
unsetopt share_history         # enabled by /etc/zshrc, mutually exclusive with inc_append_history_time
setopt inc_append_history_time # append each command to HISTFILE once it finishes, open shells don't import each others' commands

# show the whole history by default (the builtin only shows the last 16 entries)
# with the day each command was run (YYYY-MM-DD)
function history() {
  builtin fc -l -t '%F' "${@:-1}"
}
