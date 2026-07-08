#!/usr/bin/env bash
# Claude Code status line — Catppuccin Mocha palette

input=$(cat)

# Catppuccin Mocha ANSI approximations (256-color)
mauve='\033[38;5;183m'    # #cba6f7
blue='\033[38;5;111m'     # #89b4fa
green='\033[38;5;150m'    # #a6e3a1
peach='\033[38;5;216m'    # #fab387
yellow='\033[38;5;223m'   # #f9e2af
overlay1='\033[38;5;103m' # #7f849c
reset='\033[0m'

# Directory — use cwd from JSON, abbreviate $HOME to ~
cwd=$(echo "$input" | jq -r '.cwd')
cwd="${cwd/#$HOME/\~}"

# Git branch (skip optional locks so it never stalls)
branch=$(GIT_OPTIONAL_LOCKS=0 git -C "$(echo "$input" | jq -r '.cwd')" symbolic-ref --short HEAD 2>/dev/null)

# Model display name
model=$(echo "$input" | jq -r '.model.display_name')

# Context remaining
remaining=$(echo "$input" | jq -r '.context_window.remaining_percentage // empty')

# Build output
parts=()

# Directory segment
parts+=("$(printf "${blue}%s${reset}" "$cwd")")

# Git branch segment
if [ -n "$branch" ]; then
  parts+=("$(printf "${mauve} %s${reset}" "$branch")")
fi

# Model segment
if [ -n "$model" ] && [ "$model" != "null" ]; then
  parts+=("$(printf "${overlay1}[%s]${reset}" "$model")")
fi

# Context segment
if [ -n "$remaining" ]; then
  if (( $(echo "$remaining < 20" | bc -l) )); then
    ctx_color="$peach"
  else
    ctx_color="$green"
  fi
  parts+=("$(printf "${ctx_color}ctx:%.0f%%${reset}" "$remaining")")
fi

printf "%s" "$(IFS=' '; echo "${parts[*]}")"
