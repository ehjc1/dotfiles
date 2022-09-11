
# --
# A installation script to copy all .lua config files to .config/nvim

BASE="$(readlink -f ..)"
DOTFILE_CONFIG_PATH="$BASE/.config/nvim/lua/user"
CONFIG_PATH="~/.config/nvim/lua/user/"

ls $DOTFILE_CONFIG_PATH
for FILE in ~/.config/nvim/lua/user/*.lua; do  
  #echo "$FILE"
  $(cp "$FILE" "$CONFIG_PATH")
done

#if [ "$(cp $DOTFILE_CONFIG_PATH/* $CONFIG_PATH)" ]; then
  #echo "Nvim config file updated!"

#else
  #echo "Nvim config files failed to transfer"

#fi
