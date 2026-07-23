# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
  PATH="$HOME/.local/share:$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
  for rc in ~/.bashrc.d/*; do
    if [ -f "$rc" ]; then
      . "$rc"
    fi
  done
fi

unset rc

# UTILITY FUNCTIONS:
function venv() {
  if [[ -z $1 ]]; then
    source "$PWD/.venv/bin/activate"
  else
    source "$1/.venv/bin/activate"
  fi
}

function run_django() {
  if [[ -z $1 ]]; then
    python3 manage.py runserver
  else
    python3 manage.py runserver $1
  fi
}

# Install django-stubs into ./typings so pyright CLI matches Pylance,
# without adding a dev dependency to pyproject.toml. Run from project root.
function django-typings() {
  local tmp
  tmp=$(mktemp -d)
  uv pip install django-stubs --target="$tmp" &&
    mkdir -p typings &&
    rm -rf typings/django &&
    cp -r "$tmp/django-stubs" typings/django &&
    grep -qx "typings/" .git/info/exclude 2>/dev/null || echo "typings/" >> .git/info/exclude
  rm -rf "$tmp"
}

# . ~/z/z.sh

export EDITOR=nvim
export PAGER=bat
# SETTING the STARSHIP PROMPT
eval "$(starship init bash)"
export STARSHIP_CONFIG=~/.config/starship.toml
export FZF_DEFAULT_OPTS='--height 40%'

# ALIASES
alias e=nvim
alias config="/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"
alias pk-add="sudo dnf install"
alias pk-rem="sudo dnf uninstall"
alias do-release-upgrade="sudo dnf --refresh upgrade;sudo dnf system-upgrade --releasever="
alias docker-start="sudo systemctl start docker"
alias update-nvim="curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage"
alias run-shell="source .venv/bin/activate"
alias run-svr="python3 manage.py runserver"
alias run-ia="source /home/eugenechew/dev/IntelliMed-Analytics/.venv/bin/activate && python manage.py runserver 8200"
alias run-ic="source /home/eugenechew/dev/IntelliMed/Central/IntelliMed-Central/.venv/bin/activate && python manage.py runserver 8100"
alias ps="powershell.exe -executionpolicy bypass"
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias bat="batcat"
alias z="zoxide"

# AI
alias cc="claude"
alias cx="codex"

# GIT
alias gd="git diff"
alias gst="git status"
alias ga="git add"
alias gcm="git commit"
alias gck="git checkout"
alias gpl="git pull"
alias gp="git push"
alias gb="git blame -w -C -C -C -L"
alias lg="lazygit"

# Run the following config on new builds:
# git config --global rerere.enabled true (REuseREcordedREsolution: Tells git to remember how you resolved a merge conflict)
# git config --global column.ui auto
# git config --global branch.sort -committerdate
# git push --force-with-lease (safe force push)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
eval "$(zoxide init bash)"
eval "$(fzf --bash)"

# opencode
export PATH=/home/eugenechew/.opencode/bin:$PATH
