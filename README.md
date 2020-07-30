## Details
The core components which comprise the desktop environment.

* **OS:** [Ubuntu DDE](https://ubuntudde.com/)
* **Window manager:** [i3](https://github.com/i3/i3)
* **Compositor:** [compton](https://github.com/chjj/compton)
* **Bar:** [polybar](https://github.com/polybar/polybar)
* **App launcher:** [rofi](https://github.com/davatorium/rofi)
* **Terminal:** [kitty](https://github.com/kovidgoyal/kitty)
* **Editor:** [neovim](https://github.com/neovim/neovim)

## Installation
Installation steps are written for Ubuntu & Debian based distros. To install on a different distro, update the package installation steps in the [Makefile](https://github.com/braddellinger/dotfiles/blob/master/Makefile) to work with your package manager.

1. Clone this repo with `git clone https://github.com/braddellinger/dotfiles.git`
2. Install a [recommended font](#recommended-fonts) to ensure glyphs render properly.
3. Install everything at once with `make ubuntu` or individually with the below steps. Any preexisting directories & files will be renamed with the format `name-YYYYMMDDTHHMMDD`.
    * **X window system**
        1. Run `make xws`
        2. Enable user to adjust the backlight's brightness by identifying your username with `whoami` and then running `sudo usermod -a -G video <user>` to add the user to the _video_ group. Log out and back in to apply the change.
        3. Some config files may require updating.
            * `~/.Xresources` - Update the `xft.dpi` property based on the display's resolution.
    * **compton:** Run `make compton`
    * **i3**
        1. Run `make i3`
        2. Some config files may require updating.
            * `~/.config/i3/config` - Update the `font` property based on your preferred font. Depending on your display & polybar configurations, the `gaps` properties may also require updating.
    * **rofi:**
        1. Run `make rofi`
        2. Some config files may require updating.
            * `~/.config/rofi/config.rasi` - Update the `font` property based on your preferred font.
            * `~/.config/rofi/config.rasi` - Update the `icon-theme` proeprty based on your preferred icon theme.
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
            * `~/.config/polybar/conig.ini` - Update the `font-` properties based on your preffered fonts. Depending on your resolution and font, the `height` property may also require updating.

## Keybindings
A summary of important keybindings.

### i3
| Keybinding | Description |
| ---------- | ----------- |
| <kbd>super shift c</kbd> | Restart i3 |
| <kbd>super shift e</kbd> | Exit i3 |
| <kbd>super shift q</kbd> | Kill current window |
| <kbd>super number</kbd> | Navigate to the numbered workspace |
| <kbd>super shift number</kbd> | Move current window to the numbered workspace |
| <kbd>super space</kbd> | Display app launcher |
| <kbd>super enter</kbd> | Launch terminal |
| <kbd>super shift space</kbd> | Toggle between tiled & floating window layouts |
| <kbd>super r</kbd> and then <kbd>arrow</kbd> | Resize floating window |
| <kbd>super shift arrow</kbd> | Move floating window |

### tmux
| Keybinding | Description |
| ---------- | ----------- |
| <kbd>control a</kbd> | The tmux prefix, which must be pressed & released to initiate a tmux command  |
| <kbd>control a</kbd> and then <kbd>c</kbd> | Create a new window  |
| <kbd>control a</kbd> and then <kbd>n</kbd> | Navigate to the next window  |
| <kbd>control a</kbd> and then <kbd>p</kbd> | Navigate to the previous window  |
| <kbd>control a</kbd> and then <kbd>number</kbd> | Navigate to the window corresponding to the number |
| <kbd>control a</kbd> and then <kbd>\\</kbd> | Create a new vertical pane |
| <kbd>control a</kbd> and then <kbd>_</kbd> | Create a new horizontal pane |
| <kbd>control a</kbd> and then <kbd>v</kbd> | Arrange panes vertically and evenly |
| <kbd>control a</kbd> and then <kbd>h</kbd> | Navgiate to the pane left of current pane |
| <kbd>control a</kbd> and then <kbd>j</kbd> | Navgiate to the pane below current pane |
| <kbd>control a</kbd> and then <kbd>k</kbd> | Navgiate to the pane above current pane |
| <kbd>control a</kbd> and then <kbd>l</kbd> | Navgiate to the pane right of current pane |

### neovim
| Keybinding | Description |
| ---------- | ----------- |
| <kbd>space</kbd> | The Leader, used to initiate various actions |
| <kbd>space f</kbd> | Display file fuzzy finder |
| <kbd>space b</kbd> | Display buffer fuzzy finder |
| <kbd>space r</kbd> | Display text fuzzy finder |
| <kbd>space e</kbd> | Toggle file explorer |
| <kbd>space j</kbd> | Format JSON object |

## Recommended color schemes
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

## Recommended fonts
A collection of quality fonts from [nerdfonts](https://www.nerdfonts.com/).

* Inconsolata
* FiraMono 
* Iosevka 
