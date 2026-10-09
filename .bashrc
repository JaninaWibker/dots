#
# ~/.bashrc
#

# very condensed version of the zsh config, has a few good defaults and aliases but not much more
# intended only as a fallback option, or for other environments such as servers where you wouldn't really want to spend all too much time on dotfiles

[[ $- != *i* ]] && return
[[ $OSTYPE == linux* && -r /etc/bashrc ]] && source /etc/bashrc

[[ -x /opt/homebrew/bin/brew ]] && eval "$(/opt/homebrew/bin/brew shellenv)"

for COMPLETION in \
  "/usr/share/bash-completion/bash_completion" \
  "${HOMEBREW_PREFIX:-/opt/homebrew}/etc/profile.d/bash_completion.sh" \
  "${HOMEBREW_PREFIX:-/opt/homebrew}/etc/bash_completion.d/"*; do
  # can skip rest if bash-completion (linux,brew) loads
  [[ -n $BASH_COMPLETION_VERSINFO$BASH_COMPLETION ]] && break
  [[ -f $COMPLETION ]] && source "$COMPLETION"
done

export EDITOR=vim

HISTSIZE=100000
HISTFILESIZE=100000
HISTCONTROL=ignoreboth
HISTTIMEFORMAT='%F '
shopt -s histappend checkwinsize
shopt -s autocd 2>/dev/null
stty -ixon 2>/dev/null

bind 'set completion-ignore-case on'
bind 'set show-all-if-ambiguous on'
bind '"\e[A": history-search-backward' # search history with prefix
bind '"\e[B": history-search-forward'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ls='ls --color=auto'
command -v gls >/dev/null && alias ls='gls --color=auto' # GNU ls on macOS
alias la='ls -a'
alias ll='ls -lh'
alias grep='grep --color=auto --exclude-dir=.git'

alias g='git'
alias gs='git status'
alias gc='git commit --verbose'
alias gf='git commit --amend --no-edit'
alias ga='git add'
alias gd='git diff'
alias gdd='git diff --staged'
alias gl='git log'

# prompt: "λ dir (branch) ✗", rebuilt before every prompt
function _prompt {
  # append history directly, not only after exiting
  history -a

  # \[ \] signals to bash that these don't take up width
  local blue='\[\e[1;34m\]'
  local cyan='\[\e[1;36m\]'
  local red='\[\e[1;31m\]'
  local yellow='\[\e[1;33m\]'
  local reset='\[\e[0m\]'

  PS1="${blue}λ ${cyan}\W${reset} " # λ, current directory

  local status
  status=$(GIT_OPTIONAL_LOCKS=0 git status --porcelain=v2 --branch 2>/dev/null) || return 0
  _prompt_branch=${status#*branch.head }
  _prompt_branch=${_prompt_branch%%$'\n'*}

  PS1+="${blue}("
  # \$ against branch-name prompt injection
  PS1+="${yellow}\${_prompt_branch}" # branch name
  PS1+="${blue})"
  # every non-header line of `git status` is a changed or untracked file
  [[ $status == *$'\n'[^#]* ]] && PS1+=" ${red}✗" # ✗ if dirty
  PS1+="${reset} "
}

[[ $PROMPT_COMMAND == *_prompt* ]] || PROMPT_COMMAND="_prompt${PROMPT_COMMAND:+; $PROMPT_COMMAND}"
