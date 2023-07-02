<h1 align="center">
    Dotfiles
</h1>

<p align="center">
    A guide for setting up my desktop in case I "accidently" mess up real bad.
</p>

<p align="center">
    <img src="./pictures/screenshots/homesweethome.png" alt="Home Sweet Home" />
</p>

## Arch installation

Using the `archinstall` script from the package repository
(NOT the one that comes by default with the ISO, apparently there is a difference)

```bash
sudo pacman -S archinstall
```

Then go through the process normally, just remember to choose the `xorg` profile
and to have `/` and `/home` on separate partitions.

## Setting up the environment

See the [wiki](https://github.com/youssef-attai/dotfiles/wiki/).

## Quick overview

- **Shell:** zsh
- **Window manager:** i3
- **Editor:**: Neovim
- **Browser:**: Firefox
- **File manager:** Thunar
- **Compositor:** picom
- **Bar:** Polybar
- **Fonts:** JetBrains Mono + Nerd Fonts Symbols Only
