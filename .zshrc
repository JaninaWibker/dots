# plugin : zsh-completions
fpath=("$XDG_CONFIG_HOME/zsh/plugins/zsh-completions/src" $fpath)

# plugin : direnv zsh integration
(( $+commands[direnv] )) && eval "$(direnv hook zsh)"

# utilities and sane defaults
source "$XDG_CONFIG_HOME/zsh/lib/main.zsh"

# own config
source "$XDG_CONFIG_HOME/zsh/main.zsh"

# plugin : zsh-syntax-highlighting (has to be loaded after other hooks, explained in its readme)
source "$XDG_CONFIG_HOME/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
