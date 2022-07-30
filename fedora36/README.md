# Dev environment setup

This documentation contains information on how to setup a new `Dev` env.



## Table of Content

1. [Fedora Initial Config](#1-fedora-initial-config)
2. [VSCode Install](#2-vscode-config)
3. Nerd Font Installtion
	- Basic Installation
9. ZSH Installtion
	- Oh my ZSH Installation
	- Powerlevel10k theme installation
	- Setup ZSH color scheme
10. Tilix Installation and configuration
11. Terminal env setup
	- doom emacs
	- neovim
11. Ranger
12. bat
13. starship
14. Neovim Installation and Configuration


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



# Doom emacs installation & setup

This section will be a documentation of the video tutorial (Doom Emacs On Day One by DistroTube)[https://www.youtube.com/watch?v=37H7bD-G7nE&t=122s&ab_channel=DistroTube]

1. Launch terminal and install emacs run command `sudo dnf install emacs`

2. navigate to the official doom emacs repo (here)[https://github.com/doomemacs/doomemacs]

3. Click on *Install* section and clone the repo by copying the commands listed there
	- follow through the installation (~10 mins)

4. Once completed, open your `.bashrc` file and add the following at the top:
	- `export PATH="$HOME/.emacs.d/bin:$PATH"` - this adds a new PATH to existing `$PATH` variable
	- save the new config and run `source .bashrc` to refresh the config

5. run `doom sync` command in your terminal

you should be good to go! :)

you can run `emacs` on your terminal and it should open the doom emacs TUI. 
However, this is **NOT** the perfered way to launch doom emacs. Emacs has a client server relationship which allows emacs to be run all the time that runs in the background. To ensure that emacs launches with speed, it is better to use the emacs server

to do this we first need to set our system to automatically startup the doom emacs daemon server
- create a bash script called `emacs-server-startup.sh` and add the following:

```bash
#!/usr/bin/env bash

/usr/bin/emacs --daemon
```

- ensure to run `chmod +x emacs-server-startup.sh` to ensure it has read/write/execute premission

- copy script to the following location:
	- `/etc/xdg/autostart`
	- `/etc/X11/xinit/xinitrc.d directory`

- restart machine

- launch terminal and run `emacsclient -c -a 'emacs'` this should launch emacs instantly

- Set this command as an alias to `emacs`
	- edit `.bashrc` file and add the following at the bottom of the file: `alias emacs="emacsclient -c -a 'emacs'"`
	- run `source .bashrc`


Setting emacs to key bind/super command

- open terminal and type in `sudo find / -iname emacs.desktop`
this will look for the emacs.desktop file and display its path as well.

- you should see a path like: `/usr/share/applications/emacs.desktop`

- run this command: `sudo cp /usr/share/applications/emacs.desktop /usr/share/applications/emacsclient.desktop`

- now navigate to the directory you just copied the file to, in this case its `/usr/share/applications`

- edit the `emacsclient.desktop` file with `sudo`
	- Change the name to `emacsclient`

- you are now ready to use doom emacs :)
	- search for `emacsclient` application and launch the app

## Configuring doom emacs

 - Play around with the `~/.doom.d/init.el` file and uncomment plugins you want to use
	-  Use `SPC f s` to save when you are done and run `SPC h r r` to restart doom with new plugins enabled

## How to use?

Doom emacs uses `evil` mode and its usage is similar to how you use vim/nvim.

### Command Abbreviations

- `C` - "Control" key
- `M` - "Alt" or "Option" key
- `S` - "Super" or "Command" key
- `SPC` - "Space" key

### General

- `SPC f s` for saving current file
- `SPC f r` find recent file
- `SPC h r r` to restart doom
- `SPC .` for using `find-file` command
- `M x` or `SPC :` for entering commands
- `C w v` for splitting screen vertically
- `C w c` for closing split screen
- `C w w` switching split

### Navigation & basic commands










 
