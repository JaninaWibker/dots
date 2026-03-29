# setting the most important env variables
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export MAMBARC="$XDG_CONFIG_HOME/mamba/mambarc"

# setting path variable
path+=('/opt/homebrew/bin')
path+=('/opt/homebrew/sbin')
path+=('/usr/local/sbin')
path+=('/usr/local/opt/ruby/bin')
path+=('/usr/local/dvisvgm/bin')
path+=('$HOME/.gem/ruby/3.0.0/bin')
path+=('$HOME/scripts')
path+=('$HOME/.yarn/bin:$XDG_CONFIG_HOME/yarn/global/node_modules/.bin')
