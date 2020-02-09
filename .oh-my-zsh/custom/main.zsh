### Vi awesomeness
bindkey -v
export KEYTIMEOUT=1 # 0.1s

### Emacs awesomeness
#bindkey -e

### Folders
export PRJ="${HOME}/Desktop/projects"

export XDG_CONFIG_HOME="$HOME/.config"

### vim
export VIMINIT="source $XDG_CONFIG_HOME/vim/vimrc"

export EDITOR="/usr/bin/vim"

### USB STICK | EXT. VOLUME
export JANNIK="/Volumes/JANNIK"

### Path
#export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$HOME/flutter/bin:/usr/local/lib/node_modules/bin:/usr/local/go/bin"

### LUA ROCKS PATH THINGY
eval $(luarocks path --bin)

### RUBY GEMS PATH THINGY
export PATH="$PATH:$HOME/.gem/ruby/2.6.0"

### GO PATH THINGY
export PATH="$PATH:$HOME/go/bin"

### Script thingy
export PATH="$PATH:$HOME/scripts"

### Program thingies
export PATH="$PATH:$HOME/programs:$HOME/programs/links"

### NVM
export NVM_DIR="/Users/pingraham/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

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
