# dotfiles
things to install:
* zsh
* oh-my-zsh
* i3
* i3blocks
* JetBrains Mono font
* lxappearance
* papirus-icon-theme
* thunar
* neovim

set oh-my-zsh theme to `agnoster`

set catpuccin theme in lxappearance, which is downloaded in i3 config already

set papirus icon theme in lxappearance

load gnome-terminal profile with `dconf load /org/gnome/terminal/legacy/profiles:/ < gnome-terminal-profiles.dconf` (should be replaced with catpuccin gnome-terminal theme)

## Arch needed commands so far
```
sudo pacman -S xorg
yay -S ttf-jetbrains-mono-nerd
setxkbmap -layout pl
sudo pacman -S networkmanager
sudo systemctl start NetworkManager.service
sudo pacman -S network-manager-applet
yay -S git-delta
```
Add to `/etc/X11/xorg.conf.d/90-touchpad.conf`
```
Section "InputClass"
        Identifier "touchpad"
        MatchIsTouchpad "on"
        Driver "libinput"
        Option "Tapping" "on"
        Option "NaturalScrolling" "true"
        Option "TappingButtonMap" "lrm" # 1/2/3 finger, for 3-finger middle lrm
EndSection
```
