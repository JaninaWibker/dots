# setting the most important env variables
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export ANDROID_HOME=/opt/android-sdk
export FZF_PATH="$HOME/.config/fzf"
export MAMBARC="$XDG_CONFIG_HOME/mamba/mambarc"

# setting path variable
path+=('/opt/homebrew/bin')
path+=('/opt/homebrew/sbin')
path+=('/usr/local/sbin')
path+=('$HOME/.gem/ruby/3.0.0/bin')
path+=('/usr/local/opt/ruby/bin')
path+=('/usr/local/dvisvgm/bin')
path+=('$HOME/scripts')
path+=('$HOME/programs:$HOME/programs/links:$HOME/programs/cm/release_target/')
path+=('$ANDROID_HOME/emulator')
path+=('$ANDROID_HOME/platform-tools/')
path+=('$ANDROID_HOME/tools/bin/')
path+=('$ANDROID_HOME/tools/')
path+=('${FZF_PATH}/bin')
path+=('$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin')
path+=('/opt/homebrew/opt/node@16/bin')

