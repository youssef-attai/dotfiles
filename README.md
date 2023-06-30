# Dotfiles

A guide for setting up my desktop in case I "accidently" mess up real bad.

## Software

All the programs I use.

### [zsh](https://archlinux.org/packages/extra/x86_64/zsh/)

The default shell

- Installation:

```bash
sudo pacman -S zsh
```

### [yay](https://github.com/Jguer/yay)

AUR helper.

- Installation:

Ironically, from the [AUR](https://aur.archlinux.org/packages/yay)

```bash
cd ~/git
git clone https://aur.archlinux.org/yay.git
cd yay
sudo makepkg -si
```

### [alacritty](https://github.com/alacritty/alacritty)

The default terminal

- Installation:

```bash
sudo pacman -S alacritty
```

### [picom](https://github.com/yshui/picom)

X Compositor, for window effects like shadows, fading, blurring, etc.

- Installation:

From the [AUR](https://aur.archlinux.org/packages/picom-git)

```bash
yay -S picom-git
```

### [clipmenu](https://github.com/cdown/clipmenu)

Clipboard manager that uses rofi.

- Installation:

```bash
sudo pacman -S clipmenu
```

### [dunst](https://github.com/dunst-project/dunst)

Notification daemon.

- Installation:

```bash
sudo pacman -S dunst
```

### [mpd](https://github.com/MusicPlayerDaemon/MPD)

Music player daemon.

- Installation:

```bash
sudo pacman -S mpd
```

### [mpDris2](https://github.com/eonpatapon/mpDris2)

mpd doesn't work with playerctl by default.
This daemon makes mpd controllable via playerctl.

- Installation:

```bash
cd ~/git
git clone git://github.com/eonpatapon/mpDris2.git
cd mpDris2
./autogen.sh --sysconfdir=/etc
sudo make install
```

### [playerctl](https://github.com/altdesktop/playerctl)

For controlling media playing via the command-line.

- Installation:

```bash
sudo pacman -S playerctl
```

### [i3wm](https://github.com/i3/i3)

The tiling window manager

- Installation:

```bash
sudo pacman -S i3-wm
```

### [i3-layouts](https://github.com/eliep/i3-layouts)

Facilitates dealing with layouts for i3.

- Installation:

From the [AUR](https://aur.archlinux.org/packages/i3-layouts)

```bash
yay -S i3-layouts
```

### [i3lock-fancy](https://github.com/meskarune/i3lock-fancy)

A screen locker.
It takes a screenshot of the desktop, blurs the background,
and adds a lock icon and text

- Installation:

From the [AUR](https://aur.archlinux.org/packages/i3lock-fancy-git)

```bash
yay -S https://aur.archlinux.org/i3lock-fancy-git.git
```

### [networkmanager-dmenu](https://github.com/firecat53/networkmanager-dmenu)

For managing network connections with rofi.

- Installation:

From the [AUR](https://aur.archlinux.org/packages/networkmanager-dmenu-git)

```bash
yay -S networkmanager-dmenu-git
```

### [neofetch](https://github.com/dylanaraps/neofetch)

For bullying Ubuntu users.

- Installation:

```bash
sudo pacman -S neofetch
```

### [rofi](https://github.com/davatorium/rofi)

It's really hard to explain, it's basically a replacment for dmenu.
It's a dynmic interactive list thingy.

- Installation:

```bash
sudo pacman -S rofi
```

### [polybar](https://github.com/polybar/polybar)

The status bar

- Installation:

```bash
sudo pacman -s polybar
```

### [neovim](https://github.com/neovim/neovim)

The default text/code editor

- Installation:

```bash
sudo pacman -S neovim
```

### [ncmpcpp](https://github.com/ncmpcpp/ncmpcpp)

A terminal-based client for mpd

- Installation

```bash
sudo pacman -S ncmpcpp
```

### [rofi-emoji](https://github.com/Mange/rofi-emoji)

Emoji selector plugin for rofi

- Installation:

```bash
sudo pacman -S rofi-emoji
```

### [maim](https://github.com/naelstrof/maim)

It takes screenshots

- Installation:

```bash
sudo pacman -S maim
```

### [rofi-power-menu](https://github.com/jluttine/rofi-power-menu)

A power menu plugin for rofi

- Installation:

```bash
cd ~/bin
curl -o rofi-power-menu https://raw.githubusercontent.com/jluttine/rofi-power-menu/master/rofi-power-menu
sudo chmod +x rofi-power-menu
```
