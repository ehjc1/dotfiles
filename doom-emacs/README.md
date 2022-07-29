# Doom emacs

## Getting started with `doomemacs`

This documentation will cover basic setup and configuration for `doomemacs` as well as some basic 
commands to run for everyday use

## Doom emacs installation & setup

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

- ensure to run `chmod +x emacs-server-startup.sh` to ensure it has read/write/execute permission

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
