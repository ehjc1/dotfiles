```
 ██████████      ███████    ███████████ ███████████ █████ █████       ██████████
░░███░░░░███   ███░░░░░███ ░█░░░███░░░█░░███░░░░░░█░░███ ░░███       ░░███░░░░░█
 ░███   ░░███ ███     ░░███░   ░███  ░  ░███   █ ░  ░███  ░███        ░███  █ ░ 
 ░███    ░███░███      ░███    ░███     ░███████    ░███  ░███        ░██████   
 ░███    ░███░███      ░███    ░███     ░███░░░█    ░███  ░███        ░███░░█   
 ░███    ███ ░░███     ███     ░███     ░███  ░     ░███  ░███      █ ░███ ░   █
 ██████████   ░░░███████░      █████    █████       █████ ███████████ ██████████
░░░░░░░░░░      ░░░░░░░       ░░░░░    ░░░░░       ░░░░░ ░░░░░░░░░░░ ░░░░░░░░░░ 
                                                                                
```

## Contents

- [fedora36 Config](#Fedora36-Config)
- [tilix Config](#Tilix-Config)
- vim (NeoVim) Config
- bash Config
- zsh Config

## Quick Start

TODO: Use Nix to manage packages (works on all system)


## Fedora36 Config

Fedora36 fresh install config will consists of the following:

- [DNF Config](#dnf-config)
- [System Update](#system-update)
- [Enable RPM Fusion](#enable-rpm-fusion)
- [Adding Flatpack](#adding-flatpack)

### DNF Config

Edit the following file: `/etc/dnf/dnf.conf`

add the following to file:
```
[main]
gpgcheck=True
installonly_limit=3
clean_requirements_on_remove=True
best=False
skip_if_unavailable=True
# Added for Speed:
fastestmirror=True
max_parallel_downloads=10
defaultyes=True
keepcache=True
```

### System Update

Clearing `Cache`: `sudo dnf clean dbcache/all`

Updating system: `sudo dnf update`

### Enable RPM Fusion

Official RPM Fusions site [here](https://rpmfusion.org/Configuration).

To enable RPM Fusion run the following command:

```
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

To enable `AppStream metadata` run the following command: `sudo dnf groupupdate core`

To install `Multimedia post-install`, run: 
```
sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
```
and 
```
sudo dnf groupupdate sound-and-video
```

**NOTE:** This command may change in the future, plesase refer to the official fedora RPM Fusion site for more info.


### Adding Flatpack

Run the following command: 
```
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

## Tilix Config

Tilix is a tiling terminal emulator that I will be using. In this config we will cover the following:

- [Installation](#Installation)
- [Nerd Font Installation](#Nerd-Font-Installation)
- [Quick Shortcuts](#Shortcuts)

### Installation:

*UBUNTU:*
```
sudo apt install tilix
```
*Fedora:*
```
sudo dnf install tilix
```
*Arch:*
```
pacman -S tilix
```

### Nerd Font Installation 


### Shortcuts


1. clone this repo

2. copy `.config/nvim` to `~/.config/nvim/`

## Dependencies

1. Nerd Font
