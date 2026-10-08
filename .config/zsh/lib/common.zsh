# no duplicate entries in path and fpath, removes already existing ones as well
typeset -U path fpath

# allow comments in interactive shells, e.g. when pasting snippets
setopt interactivecomments

# show the PID in job notifications, e.g. "[1]  + 12345 suspended  vim"
setopt long_list_jobs

# only letters and digits are part of a word, e.g. ^W stops at / - . _
WORDCHARS=''

# ^S / ^Q don't freeze / unfreeze the terminal
unsetopt flowcontrol

DIRSTACKSIZE=21          # 20 + 1, because current directory also counts
setopt auto_cd           # change directory without `cd`
setopt auto_pushd        # push directories to stack (see `dirs` command)
setopt pushd_ignore_dups # but remove duplicates
setopt pushdminus        # navigate stack with `cd -N`, with N=0 current directory, N=1 first of stack (i.e. previous), N=20 last of stack; `cd -` is the same as `cd -1`
