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

[chris@machine's ]()
# Features
- Custom keymaps
- plugins
- ColourSchemes
- Autocompletion
- Adding icons using Nerg Fonts
- LSP setup tut
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
On a fresh machine run command:

`git clone git@github.com:ChristianChiarulli/Neovim-from-scratch.git ~/.config/nvim`

1. **[OPT-1]** this repo will populate config files for you using chris@machine's configuration. For the sake of this guide it would be easier to follow along with the preset config. 
(***NOTE:*** You can edit this later :))

2. **[OPT-1]** For a complete clean slate with no preset do the following:
   1. Navigate to the release page for neovim found [here](https://github.com/neovim/neovim/releases)
   2. Find the latest release and follow the installation steps for your `OS` for sake of ease of use I will be installing via `AppImage`, run command: `curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage` in your home dir
      1. Run `chmod u+x nvim.appimage` to make it executable with the right permissions
      2. Run `./nvim.appimage` to launch nvim in your terminal
      3. If it works then run command `mv nvim.appimage /usr/local/bin/nvim` 

For users with existing config file please ensure to back up your config file. Run command: `cp ~/.config/nvim ~/.config/bak.nvim`

# Configuration

In this configuration section we will cover 22 different `nvim` configs. With 2 different veriations. 

1. **`[OPT-1]`** - Using *chris@machine's* config 
2. **`[OPT-2]`** - Using custom *new* config

for each configuration sub section I will cover how to configure for both a preset config (`[OPT-1]`) and a custom config (`[OPT-2]`).

## 1) Options


1. cd into `~/.config/nvim` dir



# How to use?
List of useful keybinds