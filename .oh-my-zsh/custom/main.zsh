### Vi awesomeness
bindkey -v
export KEYTIMEOUT=1 # 0.1s
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word # just can't live without w, a and e emacs shortcuts tbh
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey '^b' backward-char
bindkey '^f' forward-char

bindkey '^r' history-incremental-search-backward

bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down
bindkey "^w" backward-kill-word # Delete word

bindkey -M vicmd "^V" edit-command-line

bindkey '^[[Z' reverse-menu-complete # Shift-Tab support for auto completion

if [[ "$OSTYPE" != "linux-gnu" ]]; then
  export LANG=en_US.UTF-8
fi

### Emacs awesomeness
#bindkey -e

### Folders
export PRJ="${HOME}/Desktop/projects"
export STD="/run/user/1000/gvfs/smb-share:server=samba-server,share=files.studium"

# incase .profile does not set the editor correctly
export EDITOR="/usr/bin/vim"
export BROWSER="/usr/bin/chromium"

### USB STICK | EXT. VOLUME
export JANNIK="/Volumes/JANNIK"

### Path
#export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$HOME/flutter/bin:/usr/local/lib/node_modules/bin:/usr/local/go/bin"

### LUA ROCKS PATH THINGY
eval $(luarocks path --bin)

### RUBY GEMS PATH THINGY
export PATH="$PATH:$HOME/.gem/ruby/2.6.0/bin"
export PATH="$PATH:$HOME/.gem/ruby/2.7.0/bin"
export PATH="/usr/local/opt/ruby/bin:$PATH"

### GO PATH THINGY
export PATH="$PATH:$HOME/go/bin"

### RUST PATH THINGY
export PATH="$PATH:$HOME/.cargo/bin"

### YARN PATH THINGY
export PATH="$PATH:$HOME/.yarn/bin"

### Script thingy
export PATH="$PATH:$HOME/scripts"

### dvisvgm thingy
export PATH="$PATH:/usr/local/dvisvgm/bin"

### Program thingies
export PATH="$PATH:$HOME/programs:$HOME/programs/links"

### NVM
if [[ "$OSTYPE" != "linux-gnu" ]]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
fi

### Inkscape on MacOS
if [[ "$OSTYPE" != "linux-gnu" ]]; then
  export PATH="$PATH:/Applications/Inkscape.app/Contents/MacOS/"
fi

# incase .profile does not set these correctly
export HIGH_DPI=1
export THEME_VARIANT="dark"

### NPM FOLDER PREFIX; used by dependency of markdown-preview-enhanced (which searches for the install location of global npm packages
export PREFIX="/usr/local/"

### ZSH Syntax Highlighting
source $ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

typeset -A ZSH_HIGHLIGHT_STYLES

ZSH_HIGHLIGHT_STYLES[command]=none
ZSH_HIGHLIGHT_STYLES[unknown-token]=none
ZSH_HIGHLIGHT_STYLES[path]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[builtin]=none
ZSH_HIGHLIGHT_STYLES[alias]=none
ZSH_HIGHLIGHT_STYLES[function]=none
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=cyan
ZSH_HIGHLIGHT_STYLES[precommand]=fg=white,underline
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=red
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=red

bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

bindkey "^[[1;5C" end-of-line
bindkey "^[[1;5D" beginning-of-line
