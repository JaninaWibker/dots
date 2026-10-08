# mixture of vi, emacs, and general keybindings

autoload -U \
  up-line-or-beginning-search \
  down-line-or-beginning-search \
  edit-command-line

zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
zle -N edit-command-line

# key sequences explained:
# ^X       Ctrl-X (case insensitive; works for other letters as well)
# ^[       Escape
# ^?       Backspace (sometimes terminals send ^H instead)
# ^[[A     Up
# ^[[B     Down
# ^[[C     Right
# ^[[D     Left
# ^[[Z     Shift-Tab
# ^[[3~    Delete
# ^[[3;5~  Ctrl-Delete
# ^[[1;3C  Alt-Right
# ^[[1;3D  Alt-Left
# ;3 / ;5  Alt / Ctrl held down (as in Alt-Right, Ctrl-Delete)

# -M viins: insert mode
# -M vicmd: normal mode, visual mode
# escape sequences (^[[...) also need a normal mode binding, otherwise their remaining characters get interpreted as vi commands

KEYTIMEOUT=1 # 10ms
bindkey -v

bindkey -M viins '^P' up-history # Ctrl-P
bindkey -M viins '^N' down-history # Ctrl-N
bindkey -M viins '^[[Z' reverse-menu-complete # Shift-Tab
bindkey -M viins '^R' history-incremental-search-backward # Ctrl-R; stays redo in normal mode
bindkey -M vicmd '^V' edit-command-line # Ctrl-V; edit current command in $EDITOR

bindkey -M viins '^[[3~' delete-char # Delete
bindkey -M vicmd '^[[3~' delete-char # Delete
bindkey -M viins '^[[3;5~' kill-word # Ctrl-Delete
bindkey -M vicmd '^[[3;5~' kill-word # Ctrl-Delete

bindkey -M viins '^H' backward-delete-char # Ctrl-H
bindkey -M viins '^?' backward-delete-char # Backspace
bindkey -M vicmd '^?' backward-delete-char # Backspace

bindkey -M viins '^[[A' up-line-or-beginning-search # Up
bindkey -M viins '^[[B' down-line-or-beginning-search # Down
bindkey -M vicmd '^[[A' up-line-or-beginning-search # Up
bindkey -M vicmd '^[[B' down-line-or-beginning-search # Down

# same in insert and normal mode, need to be bound per-mode
bindkey -M viins '^[[1;3C' forward-word  # Alt-Right
bindkey -M viins '^[[1;3D' backward-word # Alt-Left
bindkey -M vicmd '^[[1;3C' forward-word  # Alt-Right
bindkey -M vicmd '^[[1;3D' backward-word # Alt-Left

# just can't live without w, a and e emacs shortcuts tbh
bindkey -M viins '^W' backward-kill-word # Ctrl-W
bindkey -M viins '^U' backward-kill-line # Ctrl-U
bindkey -M viins '^A' beginning-of-line # Ctrl-A
bindkey -M viins '^E' end-of-line # Ctrl-E
bindkey -M viins '^B' backward-char # Ctrl-B
bindkey -M viins '^F' forward-char # Ctrl-F
