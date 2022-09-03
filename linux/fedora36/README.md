# Dev environment setup

This documentation contains information on how to setup a new `Dev` env.



## Table of Content

1. [Fedora Initial Config](#1-fedora-initial-config)
2. [VSCode Install](#2-vscode-config)
3. [Tilix Installation]()


# 1) Fedora Initial Config

## 1.1) DNF Config

To get started open up a `terminal` and enter `sudo nano /etc/dnf/dnf.conf`

you should see something like this:
```
# see `man dnf.conf` for defaults and possible options

[main]
gpgcheck=True
installonly_limit=3
clean_requirements_on_remove=True
best=False
skip_if_unavailable=True
```

now enter these on a new line:

```
# see `man dnf.conf` for defaults and possible options

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

Save and quit: `ctrl+o` -> `ctrl+x`

**TIP**: you can run `sudo dnf clean dbcache/all` this will clean all cache



## 1.2) System Update


Open `terminal` and run command `sudo dnf update`


## 1.3) Enable RPM Fusion

(Official RPM Fusion site)[https://rpmfusion.org/Configuration]

1. Navigate to `Command Line Setup using rpm`

2. Paste this command into the `terminal` and run:
 `sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm`
**NOTE:** This command may change in the future, refer to official fedora RPM Fusion site for more info.

3. Install `AppStream metadata` as well, command:
`sudo dnf groupupdate core`

4. Also Install `Multimedia post-install`, run:
`sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin`
and 
`sudo dnf groupupdate sound-and-video`


## 1.4) Adding Flatpack

Launch your terminal and enter this command `flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo`

# 2) VScode Config

Navigate to the official VScode site [here](https://code.visualstudio.com/docs/setup/linux)

# 3) Tilix Installation

## linux
1. To Install `Tilix` you run the following command:

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

2. Once Installed go to settings and change the following options:

  - Appearance -> UNCHECK `Show the terminal title even if it's the only terminal`
  - Appearance -> Change `Theme Varient` to Dark/light
  - Appearance -> CHECK `Use tabs instead of sidebar (Application restart required)`

We are now going to change the terminal colour scheme, we will be using `Dracula` for our terminal 
colour scheme. Official `Dracula` webpage [here](https://draculatheme.com/tilix) 
To change `Tilix` colour scheme do the following:

1. Click on the link provided above and download the zip file

2. unzip the file

3. Copy `Dracula.json` under `~/.config/tilix/schemes` (first create directory if not exist)

4. Go to `Preferences` and select your Tilix profile

5. Select `Colour` tab 

6. Select `Dracula` from dropdown





 
