# setting the most important env variables
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export ANDROID_HOME=/opt/android-sdk
export FZF_PATH="$HOME/.config/fzf"

# setting path variable
path+=('$PATH:/usr/local/sbin')
path+=('$PATH:/opt/homebrew/bin')
path+=('$PATH:$HOME/.gem/ruby/3.0.0/bin')
path+=('$PATH:/usr/local/opt/ruby/bin')
path+=('$PATH:/usr/local/dvisvgm/bin')
path+=('$PATH:$HOME/scripts')
path+=('$PATH:$HOME/programs:$HOME/programs/links:$HOME/programs/cm/release_target/')
path+=('$PATH:$ANDROID_HOME/emulator')
path+=('$PATH:$ANDROID_HOME/platform-tools/')
path+=('$PATH:$ANDROID_HOME/tools/bin/')
path+=('$PATH:$ANDROID_HOME/tools/')
path+=('$PATH:${FZF_PATH}/bin')
path+=('$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH')
