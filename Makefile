
# Makefile to update Neovim AppImage
NVIM_URL = https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
	TMP_PATH = /tmp/nvimappimage
	DEST = $(shell which nvim)

.PHONY: update-nvim

update-nvim:
	@echo "Downloading latest Neovim AppImage..."
	curl -Lo $(TMP_PATH) $(NVIM_URL)
	chmod +x $(TMP_PATH)
	@echo "Moving to $(DEST)... (may require sudo)"
	sudo mv $(TMP_PATH) $(DEST)
	@echo "Neovim updated at $(DEST)"
