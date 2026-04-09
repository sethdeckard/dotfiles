#!/usr/bin/env bash
# Claude Code status line
# Displays: user@host  cwd  git-branch  model  context%

input=$(cat)

user=$(whoami)
host=$(hostname -s)
cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // ""')
# Abbreviate $HOME as ~
cwd="${cwd/#$HOME/~}"

model=$(echo "$input" | jq -r '.model.display_name // ""' | sed 's/ ([^)]*context)$//')

# Git branch (skip optional locks, suppress errors)
git_branch=""
if git_dir=$(GIT_OPTIONAL_LOCKS=0 git -C "${cwd/#\~/$HOME}" rev-parse --git-dir 2>/dev/null); then
  branch=$(GIT_OPTIONAL_LOCKS=0 git -C "${cwd/#\~/$HOME}" symbolic-ref --short HEAD 2>/dev/null \
           || GIT_OPTIONAL_LOCKS=0 git -C "${cwd/#\~/$HOME}" rev-parse --short HEAD 2>/dev/null)
  [ -n "$branch" ] && git_branch=" \033[36m($branch)\033[0m"
fi

# Color remaining percentage: green >= 60, yellow >= 35, orange >= 15, red < 15
remaining_color() {
  local pct=$1
  if [ "$pct" -lt 15 ]; then printf "\033[31m"
  elif [ "$pct" -lt 35 ]; then printf "\033[38;5;208m"
  elif [ "$pct" -lt 60 ]; then printf "\033[33m"
  else printf "\033[32m"; fi
}

# Context remaining
ctx=""
used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
if [ -n "$used" ]; then
  p=$(printf "%.0f" "$used")
  r=$((100 - p))
  ctx=" ctx:$(remaining_color "$r")${r}%\033[0m"
fi

# Rate limit remaining: session(5h) / week(7d)
usage=""
rate_5h=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')
rate_7d=$(echo "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty')
if [ -n "$rate_5h" ] || [ -n "$rate_7d" ]; then
  r5=$([ -n "$rate_5h" ] && printf "%.0f" "$((100 - $(printf "%.0f" "$rate_5h")))" || echo "-")
  r7=$([ -n "$rate_7d" ] && printf "%.0f" "$((100 - $(printf "%.0f" "$rate_7d")))" || echo "-")
  c5=$([ "$r5" != "-" ] && remaining_color "$r5" || printf "\033[37m")
  c7=$([ "$r7" != "-" ] && remaining_color "$r7" || printf "\033[37m")
  r5_display=$([ "$r5" != "-" ] && echo "${r5}%" || echo "-")
  r7_display=$([ "$r7" != "-" ] && echo "${r7}%" || echo "-")
  usage=" 5h:${c5}${r5_display}\033[0m 7d:${c7}${r7_display}\033[0m"
fi

printf "%b\n" "\033[32m${user}@${host}\033[0m \033[34m${cwd}\033[0m${git_branch} \033[35m${model}\033[0m${ctx}${usage}"
