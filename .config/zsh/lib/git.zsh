# git info for the prompt, e.g. "(main) ✗", runs synchronously
# parses `git status --porcelain=v2 --branch` output
# parses `git describe` output if detached HEAD to check if a tag exists for the current commit
# formatting uses $ZSH_THEME_GIT_PROMPT_{PREFIX,SUFFIX,DIRTY,CLEAN} (set by the theme)
function git_prompt_info {
  local git_status
  git_status=$(GIT_OPTIONAL_LOCKS=0 command git status --porcelain=v2 --branch --ignore-submodules=dirty 2>/dev/null) || return
  local -a lines=("${(@f)git_status}")
  local ref=${${(M)lines:#\# branch.head *}#\# branch.head }

  if [[ $ref == "(detached)" ]]; then
    # tag name if HEAD is on a tag, otherwise the short commit hash
    local oid=${${(M)lines:#\# branch.oid *}#\# branch.oid }
    ref=$(GIT_OPTIONAL_LOCKS=0 command git describe --tags --exact-match HEAD 2>/dev/null) || ref=$oid[1,7]
  fi

  # every non-header line is a changed or untracked file
  local -a changes=(${lines:#\#*})
  local dirty
  if (( ${#changes} > 0 )); then
    dirty=$ZSH_THEME_GIT_PROMPT_DIRTY
  else
    dirty=$ZSH_THEME_GIT_PROMPT_CLEAN
  fi

  # escape % (as %%) so branch/tag names can't be interpreted as prompt sequences like %F{red}
  ref=${ref//\%/%%}

  echo "$ZSH_THEME_GIT_PROMPT_PREFIX$ref$dirty$ZSH_THEME_GIT_PROMPT_SUFFIX"
}
