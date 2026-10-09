#
# ~/.bash_profile
#

# copy this file depending on distro, use case, and other files:
# - some login shells only read ~/.bash_profile, not ~/.bashrc -> copy to load ~/.bashrc
# - ~/.profile can get ignored if ~/.bash_profile exists       -> rely on .profile to load ~/.bashrc (and modify $PATH)
[[ -f ~/.bashrc ]] && source ~/.bashrc
