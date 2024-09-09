# Dotfiles
My dotfiles repo. After installing programs,
configs can be linked via `GNU stow`,
dependencies are listed below.
Some tools didn't require configs to store, they are listed as well.
The commands provided are for Arch linux yay AUR package manager.

# Program and config dependencies

### JetBrains Mono font
Needed for multiple tools.
```sh
yay -S ttf-jetbrains-mono-nerd
```

### Xorg
i3 requirement. Preinstalled in Ubuntu.
```sh
yay -S xorg
```
After installation.
To have touchpad tapping and double finger scrolling add to `/etc/X11/xorg.conf.d/90-touchpad.conf`:
```conf
Section "InputClass"
        Identifier "touchpad"
        MatchIsTouchpad "on"
        Driver "libinput"
        Option "Tapping" "on"
        Option "NaturalScrolling" "true"
        Option "TappingButtonMap" "lrm" # 1/2/3 finger, for 3-finger middle lrm
EndSection
```

### Feh
For wallpaper setup via i3.
```sh
yay -S feh
```

### Brightness control
For i3 brightness keybindings. `xbacklight` didn't work for me.
```sh
yay -S brightnessctl
```

### Screenshots
For i3 screenshot keybindings. `xclip` is also needed.
```sh
yay -S maim
yay -S xdotool
```

### Network Manager Applet
For wifi tray icon. Preinstalled in Ubuntu.  
[Arch wiki page](https://wiki.archlinux.org/title/NetworkManager)
```sh
yay -S networkmanager
sudo systemctl start NetworkManager.service
yay -S network-manager-applet
```

### Xclip
X11 cli clipboard needed for Neovim. Preinstalled in Ubuntu.
```sh
yay -S xclip
```

### Ripgrep
For Neovim's telescope plugin.
```sh
yay -S ripgrep
```

### Delta
For lazygit prettier diff.
```sh
yay -S git-delta
```
### npm
For nvim pyright
```sh
yay -S npm
```

## Manual configs
It didn't make sense to store those configs in Stow.
The default, oftentimes guided configs works fine and I just wanted to adjust minor things.

### Zsh
[Arch wiki page](https://wiki.archlinux.org/title/zsh)  
After Zsh installation and basic setup.
I've installed p10k and zsh-autosuggestions, it added some things to `.zshrc`.
Then I only added keybinding and alias settings to the bottom of the file:
```zsh
# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"

# setup key accordingly
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"       beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"        end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"     overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}"  backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"     delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"         up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"       down-line-or-history
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"       backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"      forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"     beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"   end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}"  reverse-menu-complete

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

key[Control-Left]="${terminfo[kLFT5]}"
key[Control-Right]="${terminfo[kRIT5]}"

[[ -n "${key[Control-Left]}"  ]] && bindkey -- "${key[Control-Left]}"  backward-word
[[ -n "${key[Control-Right]}" ]] && bindkey -- "${key[Control-Right]}" forward-word

bindkey '^R' history-incremental-search-backward

zstyle ':completion:*' menu select

alias vi="nvim"
```

### Powerlevel10k
Install based on the repo guide: https://github.com/romkatv/powerlevel10k  
With terminal catpuccin color scheme,
path colors were blending with the background,
so I changed it as follows:  
In `.p10k.zsh` Change `POWERLEVEL9K_DIR_FOREGROUND`, `POWERLEVEL9K_DIR_ANCHOR_FOREGROUND` and `POWERLEVEL9K_DIR_SHORTENED_FOREGROUND` values `0`.

### Rofi
After installation, install the catpuccin theme: https://github.com/catppuccin/rofi/tree/main

## Extra commands needed in Arch
### Enabling polish signs in the keyboard
```sh
setxkbmap -layout pl
```

