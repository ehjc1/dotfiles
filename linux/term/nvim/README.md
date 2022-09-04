# NeoVim GUIDE

## Getting started with NeoVim

This documentation will showcase how to get started with developing in `nvim` and configuring its environment.

---

### Table of contents

- [NeoVim GUIDE](#neovim-guide)
  - [Getting started with NeoVim](#getting-started-with-neovim)
    - [Table of contents](#table-of-contents)
- [Introduction](#introduction)
  - [Purpose](#purpose)
- [Features](#features)
- [Prerequisites](#prerequisites)
- [Install](#install)
- [Configuration](#configuration)
  - [1) Options](#1-options)
- [How to use?](#how-to-use)

# Introduction
## Purpose
The purpose of this documentation is for those who wish to elavate their workflow using a TUI (Text based user interface), if you are a developer coming from using VScode and would love to not have to use your mouse, this guide is for you. 

I will be diving into the installations and full configuration of nvim so that it perfoms like an IDE.

***NOTE:*** This documentation will follow guidelines from [chris@machine's playlist "Neovim from Scratch"](https://www.youtube.com/playlist?list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ)

# Features
- Custom keymaps
- plugins
- ColourSchemes
- Autocompletion
- Adding icons using Nerg Fonts
- LSP
- Telescope
- Treesitter Syntax Highlighting
- Autopairs
- Commenting support
- gitsigns
- NvimTree File Explorer
- Bufferline buffers
- Null-LS Formatting, linting
- Toggleterm | Open terminal programs in Nvim
- Terminal applications
    - Ranger
    - Bat
    - live grep

# Prerequisites
1. A linux OS
2. Basic understanding of the following:
    - `command line`
    - `git`
    - `unix` file systems 

# Install

## Linux

For a complete clean slate with no preset do the following:
   1. Navigate to the release page for neovim found [here](https://github.com/neovim/neovim/releases)
   2. Find the latest release and follow the installation steps for your `OS` for sake of ease of use I will be installing via `AppImage`, run command: `curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage` in your home dir
      1. Run `chmod u+x nvim.appimage` to make it executable with the right permissions
      2. Run `./nvim.appimage` to launch nvim in your terminal
      3. If it works then run command `mv nvim.appimage /usr/local/bin/nvim` 

For users with existing config file please ensure to back up your config file. Run command: `cp ~/.config/nvim ~/.config/bak.nvim`

Once we have installed vim and nvim we create the neccessary `files` and `dir` in `~/.config/nvim/`:
1. `~/.config/nvim/init.lua`
2. `~/.config/nvim/lua/` dir

***NOTE:***
- `init.lua` - is the entry point for the nvim config 
- `lua` dir to store our `.lua` configuration files


# Configuration

## 1) Options

1. cd into `~/.config/nvim/lua` dir and create a new file called `options.lua` this is where all vim internal variables and options are set
2. copy `.config/nvim/lua/user/options.lua` file, this file contains all neccessary options like line number


## 2) Keymaps

1. make a copy of `.config/nvim/lua/user/keymaps.lua` file
2. In this file there will several keybinds for different functionality.
   Next to each `keybind` there will be a comment to explain what the `keybind` does. 

## 3) Plugins

1. Copy the `plugins.lua` file into your  `.config/nvim/lua/user` dir 

***Note:*** Each plugin will contain a brief comment detailing its usecase

## 4) Colorschemes

1. Copy `colorscheme.lua` file into your `.config/nvim/lua/user` dir

## 5) LSP 

To install a `language server` do: 

1. Mode: `Normal` -> `:LspInstallInfo` 

2. press `/` followed by the language server you want i.e `/pyright` press `i` to install

Useful info:

- `i` install
- `u` update
- `X` delete

## 6) Telescope

***NOTE:*** To ensure `live_grep` works please do the following:

1. On a fresh `env` ensure you have [BurntSushi/ripgrep](https://github.com/BurntSushi/ripgrep#installation) installed

On Fedora:

```
sudo dnf install ripgrep
```

On Ubuntu:

```
sudo apt-get install ripgrep
```


On **macOS homebrew**:

```
brew install ripgrep
```






### Colorshcme support:
1. Material Theme (Guide [here](https://opensourcelibs.com/lib/material.nvim))

**Default Colorscheme:**

Material style: Deep ocean

### Other Popular Colorschemes:
1. [Tokyonight](https://github.com/folke/tokyonight.nvim)



github for `nvim-lspconfig`
# How to use?
List of useful keybinds


