. $XDG_CONFIG_HOME/zsh/keybinds.zsh
. $XDG_CONFIG_HOME/zsh/aliases.zsh
. $XDG_CONFIG_HOME/zsh/functions.zsh
. $XDG_CONFIG_HOME/zsh/themes/janina.zsh-theme

if [[ $OSTYPE == darwin* ]]; then
  . $XDG_CONFIG_HOME/zsh/macos.zsh
elif [[ $OSTYPE == linux* ]]; then
  . $XDG_CONFIG_HOME/zsh/linux.zsh
fi
