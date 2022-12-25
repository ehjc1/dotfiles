#!/bin/bash

BASE_URL="https://github.com/neovim/neovim/releases/latest/download/nvim.appimage"
COMMAND="$(curl -LO $BASE_URL)"

if [ -z "$COMMAND" ]; then
  echo "Success!"
  echo "$(mv )"
fi
