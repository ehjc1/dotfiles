# Portable Makefile for installing dev tools, Neovim, and Nerd Font

NVIM_URL = https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
TMP_PATH = /tmp/nvimappimage
DEST = $(shell which nvim 2>/dev/null || echo /usr/local/bin/nvim)

# NERD_FONT = FiraCode
NERD_FONT = Hack
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

.PHONY: install update-nvim install-font install-herdr update-herdr stow

# --no-folding keeps ~/.claude a real dir so runtime files (history,
# credentials, cache) never land inside the repo
stow:
	stow --no-folding ai

install:
	@echo "Detected OS: $(OS), Package Manager: $(PKG_MGR)"
	@if [ -z "$(PKG_MGR)" ]; then \
		echo "Unsupported system. Install dependencies manually."; \
		exit 1; \
	fi

	@if [ "$(PKG_MGR)" = "apt" ]; then \
		sudo apt update && sudo apt install -y stow ripgrep build-essential g++ curl unzip zoxide fzf; \
	elif [ "$(PKG_MGR)" = "dnf" ]; then \
		sudo dnf install -y stow ripgrep gcc-c++ curl unzip zoxide fzf; \
	elif [ "$(PKG_MGR)" = "pacman" ]; then \
		sudo pacman -Sy --noconfirm stow ripgrep base-devel gcc curl unzip zoxide fzf; \
	elif [ "$(PKG_MGR)" = "brew" ]; then \
		brew install stow ripgrep gcc curl unzip zoxide fzf; \
	fi
	# Install starship
	@if ! command -v starship >/dev/null 2>&1; then \
		curl -sS https://starship.rs/install.sh | sh -s -- -y; \
	fi

	@echo "Packages installed"
	@$(MAKE) update-nvim
	@$(MAKE) install-font
	@$(MAKE) install-herdr
	@$(MAKE) stow

update-nvim:
	@echo "Downloading latest Neovim AppImage..."
	curl -Lo $(TMP_PATH) $(NVIM_URL)
	chmod +x $(TMP_PATH)
	@echo "Installing to $(DEST)..."
	sudo mv $(TMP_PATH) $(DEST)
	@echo "Neovim updated at $(DEST)"

install-herdr:
	@if command -v herdr >/dev/null 2>&1; then \
		echo "herdr already installed at $$(command -v herdr)"; \
	elif [ "$(PKG_MGR)" = "brew" ]; then \
		brew install herdr; \
	else \
		echo "Installing herdr..."; \
		curl -fsSL https://herdr.dev/install.sh | sh; \
	fi

# brew installs update through brew; direct installs self-update
update-herdr:
	@if [ "$(PKG_MGR)" = "brew" ]; then \
		brew upgrade herdr; \
	else \
		herdr update; \
	fi

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

