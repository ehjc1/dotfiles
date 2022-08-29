# Primer

This repository is a step by step guide of how to setup my personal *terminal* env. 

## Dependencies
This setup process requires you to have a linux system i.e VM/WSL

## 1.neovim installation
1. Open Terminal
2. navigate to [neovim releases](https://github.com/neovim/neovim/wiki/Installing-Neovim) and navigate to the *Linux* installation section.
3. Copy the following commands into your terminal 
```
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage

chmod u+x nvim.appimage

./nvim.appimage

mv nvim.appimage /usr/local/bin/nvim

<!-- if error run: -->

sudo !!
```
nvim should now be installed
to ensure it is run `which nvim` and you should get a path `/usr/local/bin/nvim`




## 2. Nerd Font Installation

***WINDOWS***

The font that will be used for this configuration will be the `Hack` font.

1. Download `Hack` font from [Nerd Font](https://www.nerdfonts.com/font-downloads)

2. Once downloaded, unzip the font file.

3. Select files that ends with name `XXX Complete Mono Windows Compatible.ttf` and right click and click on the `install` button. 

4. Onced installed, on *Windows terminal* click on settings and navigate to your linux terminal. 

5. Navigate to your terminal and copy the font files to either your system font folder (often `/usr/share/fonts/`) or user font folder (often ~/.local/share/fonts/)

you can run this command:
```
cp -r win-home/Downloads/Hack ~/.local/share/fonts
```

6. Go to `Appearance` section and change `Font face` to the newly downloaded Font in this case mine is `Hack NF`, and click on **Save**

***LINUX***

1. Navigate to `nerd font` git hub page found [here](https://github.com/ryanoasis/nerd-fonts)

2. Click on `patched-fonts`

3. for this config we will use `Hack` font
    
4. Scroll down to the Quick Installation Section and download the `zip` file
***TIP:*** You can unzip file by installing `unzip` using the following command:
```
sudo apt/dnf install unzip
```

5. unzip the file and copy all `.ttf` files to `~/.local/share/fonts/`

***NOTE:*** you can create a `dir` in `~/.local/share/fonts/<dirname> to categorize different fonts

6. Once completed run the folowing command:

```
fc-cache -f -v
```

7. To confirm the fonts are loaded run the following command:

```
fc-list | grep "Hack"
```

## 3. Oh my zsh installation

Go to the [github ohmyzsh page](https://ohmyz.sh/)

enter this command:
```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## 4. Powerlevel10k Installation
To install Powerlevel10k theme on Oh My Zsh run the following command ([Visit github for more info](https://github.com/romkatv/powerlevel10k#installation)):

Clone PowerLevel10k
```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

Inside your terminal, in the home directory (~/) edit the `.zshrc` via nvim

```
nvim ~/.zshrc
```
Set `ZSH_THEME="powerlevel10k/powerlevel10k"` in `~/.zshrc`

restart the terminal and you should see a setup terminal GUI for powerlevel10k. Proceed with setup and you should be all done.


## 5. ZSH Color theme/scheme
[Dracula color theme](https://draculatheme.com/windows-terminal)

## 5. AstroNvim Installation
```
git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim

nvim +PackerSync
```
