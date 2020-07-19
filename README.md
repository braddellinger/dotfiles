### Details
The core components which comprise the desktop environment.

* **OS:** [Ubuntu DDE](https://ubuntudde.com/)
* **Window Manager:** [i3](https://github.com/i3/i3)
* **Bar:** [Polybar](https://github.com/polybar/polybar)
* **Shell:** [Z shell](https://en.wikipedia.org/wiki/Z_shell)
* **Terminal:** [kitty](https://github.com/kovidgoyal/kitty)
* **Editor:** [Neovim](https://github.com/neovim/neovim)
* **Font:** [FiraMono Nerd Font](https://www.nerdfonts.com/font-downloads)

### Installation
Installation steps are written for Ubuntu & Debian based distros. To install on a different distro, update the package installation steps in the [Makefile](https://github.com/braddellinger/dotfiles/blob/master/Makefile) to work with your package manager.

1. Clone this repo: `git clone https://github.com/braddellinger/dotfiles.git`
2. Install a [recommended font](#recommended-fonts) to ensure glyphs render properly.
3. Install everything at once with `make ubuntu` OR individually with the below steps. Any preexisting directories & files will be renamed with the format `name-YYYMMDDTHHMMDD`.
    * **X window system**
        1. Run `make xws`
        2. Enable user to adjust the backlight's brightness by identifying your username with `whoami` and then running `sudo usermod -a -G video <user>` to add the user to the _video_ group. Log out and back in to apply the change.
        3. Some config files may require updating.
            * `~/.Xresources` - Update the `xft.dpi` property based on the display's resolution.
    * **i3**
        1. Run `make i3`
        2. Some config files may require updating.
            * `~/.config/i3/config` - Update the `font` property based on your installed fonts. Depending on your display & polybar configurations, the `gaps` properties may also require updating.
    * **compton:** TBD
    * **Z shell:** Run `make zsh`
    * **tmux:** Run `make tmux`
    * **git:** Run `make git`
    * **python:** Run `make python`
    * **neovim:** Run `make neovim`
    * **polybar**
        1. Run `make polybar`
        2. Some config files may require updating. 
            * `~/.config/polybar/modules/backlight.ini` - Update the `card` property based on the output of `ls -1 /sys/class/backlight/`
            * `~/.config/polybar/modules/battery.ini` - Update the `battery` & `adapter` properties based on the output of `ls -1 /sys/class/power_supply/`
            * `~/.config/polybar/modules/network.ini` - Update the `interface` property based on the output of `nmcli connection show`
            * `~/.config/polybar/conig.ini` - Update the `font-0` property based on your installed fonts. Depending on your resolution and font, the `height` property may also require updating.

### Keybindings
TBD

### Recommended color schemes
A collection of quality color schemes developed by others.

* [Challenger Deep](https://challenger-deep-theme.github.io)
* [One Dark](https://github.com/joshdick/onedark.vim)
* [Dracula](https://draculatheme.com/)
* [Horizon](https://github.com/ntk148v/vim-horizon)
* [Palenight](https://github.com/drewtempelmeyer/palenight.vim)
* [Oceanic Next](https://github.com/mhartington/oceanic-next)
* [Gruvbox](https://github.com/gruvbox-community/gruvbox)
* [Ayu](https://github.com/ayu-theme/ayu-vim)
* [Nord](https://www.nordtheme.com)
* [Forest Night](https://github.com/sainnhe/forest-night)

### Recommended fonts
A collection of quality fonts from [nerdfonts](https://www.nerdfonts.com/).

* Inconsolata
* FiraMono 
* Iosevka 
