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

# Color by percentage: green < 40, yellow < 65, orange < 85, red >= 85
pct_color() {
  local pct=$1
  if [ "$pct" -ge 85 ]; then printf "\033[31m"
  elif [ "$pct" -ge 65 ]; then printf "\033[38;5;208m"
  elif [ "$pct" -ge 40 ]; then printf "\033[33m"
  else printf "\033[32m"; fi
}

# Context usage
ctx=""
used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
if [ -n "$used" ]; then
  p=$(printf "%.0f" "$used")
  ctx=" ctx:$(pct_color "$p")${p}%\033[0m"
fi

# Rate limit usage: session(5h) / week(7d)
usage=""
rate_5h=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')
rate_7d=$(echo "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty')
if [ -n "$rate_5h" ] || [ -n "$rate_7d" ]; then
  p5=$([ -n "$rate_5h" ] && printf "%.0f" "$rate_5h" || echo "-")
  p7=$([ -n "$rate_7d" ] && printf "%.0f" "$rate_7d" || echo "-")
  c5=$([ "$p5" != "-" ] && pct_color "$p5" || printf "\033[37m")
  c7=$([ "$p7" != "-" ] && pct_color "$p7" || printf "\033[37m")
  p5_display=$([ "$p5" != "-" ] && echo "${p5}%" || echo "-")
  p7_display=$([ "$p7" != "-" ] && echo "${p7}%" || echo "-")
  usage=" usg:${c5}${p5_display}\033[0m/\033[0m${c7}${p7_display}\033[0m"
fi

printf "%b\n" "\033[32m${user}@${host}\033[0m \033[34m${cwd}\033[0m${git_branch} \033[35m${model}\033[0m${ctx}${usage}"
