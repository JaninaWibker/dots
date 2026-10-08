# setting the most important env variables
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

export PRJ="$HOME/Desktop/projects"
export EDITOR="vim"


# setting path variable
# homebrew first so it wins over the macOS versions in /usr/bin
path=('/opt/homebrew/bin' '/opt/homebrew/sbin' $path)
path+=('/usr/local/sbin')
