# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source ~/.config/bash/rc

# Add your own exports, aliases, and functions here.

# --- Prompt stile ---
__prompt_git_info() {
  local branch status_str=""
  branch=$(git symbolic-ref --short HEAD 2>/dev/null) || return
  echo -n " "

  printf '\[\033[3;36m\]%s\[\033[0m\] ' "$branch"

  local ahead behind
  read -r behind ahead < <(git rev-list --left-right --count '@{u}...HEAD' 2>/dev/null)
  if [[ -n "$ahead" && -n "$behind" ]]; then
    if [[ "$ahead" -gt 0 && "$behind" -gt 0 ]]; then
      status_str+="⇕⇡${ahead}⇣${behind} "
    elif [[ "$ahead" -gt 0 ]]; then
      status_str+="⇡${ahead} "
    elif [[ "$behind" -gt 0 ]]; then
      status_str+="⇣${behind} "
    fi
  fi

  local porcelain
  porcelain=$(git status --porcelain 2>/dev/null)
  if [[ -n "$porcelain" ]]; then
    grep -q '^??' <<<"$porcelain" && status_str+="? "
    grep -q '^UU\|^AA\|^DD' <<<"$porcelain" && status_str+=" "
    grep -qE '^.M| M' <<<"$porcelain" && status_str+=" "
    grep -qE '^M |^A |^D |^R ' <<<"$porcelain" && status_str+=" "
  fi

  [[ -n "$status_str" ]] && printf '\[\033[36m\]%s\[\033[0m\]' "$status_str"
}

__prompt_dir() {
  local repo_root cur_path rel
  repo_root=$(git rev-parse --show-toplevel 2>/dev/null)

  if [[ -n "$repo_root" ]]; then
    local repo_name
    repo_name=$(basename "$repo_root")
    rel=${PWD#"$repo_root"}
    rel=${rel#/}

    if [[ -n "$rel" ]]; then
      local truncated
      truncated=$(echo "$rel" | awk -F/ '{
                n=NF; if(n>2){printf "…/%s/%s", $(n-1), $n} else {print}
            }')
      printf '\[\033[1;36m\]%s/%s\[\033[0m\]/%s ' "$repo_name" "$truncated"
    else
      printf '\[\033[1;36m\]%s\[\033[0m\] ' "$repo_name"
    fi
  else
    cur_path=${PWD/#$HOME/\~}
    local truncated
    truncated=$(echo "$cur_path" | awk -F/ '{
            n=NF; if(n>2){printf "…/%s/%s", $(n-1), $n} else {print}
        }')
    printf '\[\033[1;36m\]%s\[\033[0m\] ' "$truncated"
  fi
}

__build_prompt() {
  local exit_code=$?
  PS1=""
  PS1+="$(__prompt_dir)"
  PS1+="$(__prompt_git_info)"
  if [[ $exit_code -eq 0 ]]; then
    PS1+="\[\033[1;36m\]❯\[\033[0m\] "
  else
    PS1+="\[\033[1;36m\]\[\033[0m\] "
  fi
}

PROMPT_COMMAND=__build_prompt

load_conda() {
  # >>> conda initialize >>>
  # !! Contents within this block are managed by 'conda init' !!
  __conda_setup="$("$HOME/anaconda3/bin/conda" 'shell.bash' 'hook' 2>/dev/null)"
  if [ $? -eq 0 ]; then
    eval "$__conda_setup"
  else
    if [ -f "$HOME/anaconda3/etc/profile.d/conda.sh" ]; then
      . "$HOME/anaconda3/etc/profile.d/conda.sh"
    else
      export PATH="$HOME/anaconda3/bin:$PATH"
    fi
  fi
  unset __conda_setup
  # <<< conda initialize <<<
}

alias startconda="load_conda"
