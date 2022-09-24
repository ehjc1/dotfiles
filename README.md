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

### Config

Once Installed, launch `tilix` and go to `settings`

Go To:
- `Appearance` -> UNCHECK `Show the terminal title even if it's the only terminal`
- `Appearance` -> Change `Theme Varient` to Dark/Light
- `Appearance` -> CHECK `Use tabs instead of sidebar` (Application restart required)

### Nerd Font Installation 

***LINUX***
1. Navigate to `Nerd Font` official site [here](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts)
2. Choose a `font` that you want in the link above (In this guide we will be installing `hack`)
3. Click on the `Hack` folder and download the following `.ttf` file:
  - `Bold/complete/Hack Bold Nerd Font Complete Mono.ttf` -> [here](https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Hack/Bold/complete/Hack%20Bold%20Nerd%20Font%20Complete%20Mono.ttf)
  - `BoldItalic/complete/Hack Bold Italic Nerd Font Complete Mono` -> [here](https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Hack/BoldItalic/complete/Hack%20Bold%20Italic%20Nerd%20Font%20Complete%20Mono.ttf)
  - `Italic/complete/Hack Italic Nerd Font Complete Mono.ttf` -> [here](https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Hack/Italic/complete/Hack%20Italic%20Nerd%20Font%20Complete%20Mono.ttf)
  - `Regular/complete/Hack Regular Nerd Font Complete Mono.ttf` [here](https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete%20Mono.ttf)
4. Once downloaded, move all `.ttf` files into either your system font folder `/usr/share/fonts/` or user font folder `~/.local/share/fonts/` or `/usr/local/share/fonts`
5. Clear and regenerate your font cache and indexes with the following command:

```
fc-cache -f -v
```
You can confirm that the fonts are installed with the following command:

```
fc-list | grep "Hack"
```
6. Change `tilix` fonts to `hack` go to `Appearance` -> your profile -> check custom font and search for `Hack`

### Shortcuts

- Add terminal right - `Ctrl` + `Alt` + `R`
- Add terminal down - `Ctrl` + `Alt` + `D`
- Delete Terminal - `Ctrl` + `Shift` + `W`
- Switching terminal - `Alt` + `Arror UP | DOWN | LEFT | RIGHT`


1. clone this repo

2. copy `.config/nvim` to `~/.config/nvim/`

## Dependencies

1. Nerd Font
