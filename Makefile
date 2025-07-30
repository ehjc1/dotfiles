# Portable Makefile for installing dev tools, Neovim, and Nerd Font

NVIM_URL = https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
TMP_PATH = /tmp/nvimappimage
DEST = $(shell which nvim 2>/dev/null || echo /usr/local/bin/nvim)

NERD_FONT = FiraCode
FONT_ZIP = $(NERD_FONT).zip
FONT_URL = https://github.com/ryanoasis/nerd-fonts/releases/latest/download/$(FONT_ZIP)

OS := $(shell uname -s)

ifeq ($(OS),Darwin)
	PKG_MGR = brew
	FONT_DIR = ~/Library/Fonts
else
	ifneq (,$(shell command -v apt 2>/dev/null))
		PKG_MGR = apt
	endif
	ifneq (,$(shell command -v dnf 2>/dev/null))
		PKG_MGR = dnf
	endif
	ifneq (,$(shell command -v pacman 2>/dev/null))
		PKG_MGR = pacman
	endif
	FONT_DIR = ~/.local/share/fonts
endif

.PHONY: install update-nvim install-font

install:
	@echo "Detected OS: $(OS), Package Manager: $(PKG_MGR)"
	@if [ -z "$(PKG_MGR)" ]; then \
		echo "Unsupported system. Install dependencies manually."; \
		exit 1; \
	fi

	@if [ "$(PKG_MGR)" = "apt" ]; then \
		sudo apt update && sudo apt install -y stow ripgrep build-essential g++ curl unzip; \
	elif [ "$(PKG_MGR)" = "dnf" ]; then \
		sudo dnf install -y stow ripgrep gcc-c++ curl unzip; \
	elif [ "$(PKG_MGR)" = "pacman" ]; then \
		sudo pacman -Sy --noconfirm stow ripgrep base-devel gcc curl unzip; \
	elif [ "$(PKG_MGR)" = "brew" ]; then \
		brew install stow ripgrep gcc curl unzip; \
	fi
	@echo "Packages installed"
	@$(MAKE) update-nvim
	@$(MAKE) install-font

update-nvim:
	@echo "Downloading latest Neovim AppImage..."
	curl -Lo $(TMP_PATH) $(NVIM_URL)
	chmod +x $(TMP_PATH)
	@echo "Installing to $(DEST)..."
	sudo mv $(TMP_PATH) $(DEST)
	@echo "Neovim updated at $(DEST)"

install-font:
	@echo "Installing Nerd Font: $(NERD_FONT)..."
	mkdir -p $(FONT_DIR)
	curl -Lo /tmp/$(FONT_ZIP) $(FONT_URL)
	unzip -o /tmp/$(FONT_ZIP) -d $(FONT_DIR)
	rm /tmp/$(FONT_ZIP)
	@echo "$(NERD_FONT) Nerd Font installed in $(FONT_DIR)"
	@echo "You may need to refresh your font cache or restart terminal."
ifeq ($(OS),Linux)
	@fc-cache -fv > /dev/null || true
endif

