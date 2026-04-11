#!/usr/bin/env bash
# Claude Code status line -- Arasaka HUD theme
# Displays: SYS user@host // ZONE cwd // BR branch // MDL model // CTX % // 5h:% 7d:%

input=$(cat)

# Arasaka palette (24-bit ANSI)
_yellow="\033[1;38;2;247;247;121m"
_cyan="\033[38;2;53;242;255m"
_red="\033[38;2;255;77;109m"
_orange="\033[38;2;255;159;28m"
_blue="\033[38;2;77;166;255m"
_muted="\033[38;2;85;96;107m"
_reset="\033[0m"

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
  [ -n "$branch" ] && git_branch=" ${_muted}//${_reset} ${_muted}BR${_reset} ${_red}${branch}${_reset}"
fi

# Color remaining percentage: cyan >= 60, yellow >= 35, orange >= 15, red < 15
remaining_color() {
  local pct=$1
  if [ "$pct" -lt 15 ]; then printf "${_red}"
  elif [ "$pct" -lt 35 ]; then printf "${_orange}"
  elif [ "$pct" -lt 60 ]; then printf "${_yellow}"
  else printf "${_cyan}"; fi
}

# Context remaining
ctx=""
used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
if [ -n "$used" ]; then
  p=$(printf "%.0f" "$used")
  r=$((100 - p))
  ctx=" ${_muted}//${_reset} ${_muted}CTX${_reset} $(remaining_color "$r")${r}%${_reset}"
fi

# Rate limit remaining: session(5h) / week(7d)
usage=""
rate_5h=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')
rate_7d=$(echo "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty')
if [ -n "$rate_5h" ] || [ -n "$rate_7d" ]; then
  r5=$([ -n "$rate_5h" ] && printf "%.0f" "$((100 - $(printf "%.0f" "$rate_5h")))" || echo "-")
  r7=$([ -n "$rate_7d" ] && printf "%.0f" "$((100 - $(printf "%.0f" "$rate_7d")))" || echo "-")
  c5=$([ "$r5" != "-" ] && remaining_color "$r5" || printf "${_muted}")
  c7=$([ "$r7" != "-" ] && remaining_color "$r7" || printf "${_muted}")
  r5_display=$([ "$r5" != "-" ] && echo "${r5}%" || echo "-")
  r7_display=$([ "$r7" != "-" ] && echo "${r7}%" || echo "-")
  usage=" ${_muted}//${_reset} ${_muted}5h${_reset} ${c5}${r5_display}${_reset} ${_muted}7d${_reset} ${c7}${r7_display}${_reset}"
fi

printf "%b\n" "${_muted}SYS${_reset} ${_cyan}${user}@${host}${_reset} ${_muted}//${_reset} ${_muted}ZONE${_reset} ${_blue}${cwd}${_reset}${git_branch} ${_muted}//${_reset} ${_muted}MDL${_reset} ${_orange}${model}${_reset}${ctx}${usage}"
