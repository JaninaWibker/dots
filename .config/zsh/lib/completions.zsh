# needs to be loaded after $fpath is final and after $LS_COLORS is set (lib/theming.zsh)

zmodload -i zsh/complist

[[ -d "$XDG_CACHE_HOME/zsh" ]] || mkdir -p "$XDG_CACHE_HOME/zsh"
autoload -Uz compinit
compinit -i -d "$XDG_CACHE_HOME/zsh/zcompdump"

# support bash completion scripts (`complete ...`), has to come after compinit
autoload -Uz bashcompinit && bashcompinit

unsetopt menu_complete   # do not autoselect the first completion entry
setopt auto_menu         # show completion menu on successive tab press
setopt complete_in_word
setopt always_to_end

zstyle ':completion:*:*:*:*:*' menu select

# case insensitive, partial-word and substring completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|=*' 'l:|=* r:|=*'

# complete . and .. special directories
zstyle ':completion:*' special-dirs true

zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -u $USERNAME -o pid,user,comm -w -w"

# don't complete named directories for cd
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories

# caching makes slow completions (e.g. package managers) usable.
# depends on completion to support this.
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/zcompcache"

# don't complete system users (macOS prefixes them with _) unless nothing else matches
zstyle ':completion:*:*:*:users' ignored-patterns daemon nobody '_*'
zstyle '*' single-ignored show
