<p align="center" float="left" >
    <img width="40%" src="./assets/neovim.png" />
    <img width="40%" src="./assets/rofi_powermenu.png" />
    <img width="40%" src="./assets/rofi_apps.png" />
</p>

## Details
The core components which comprise the desktop environment.

* **OS:** [Arch](https://www.archlinux.org/)
* **Window manager:** [i3](https://github.com/i3/i3)
* **Compositor:** [picom](https://github.com/ibhagwan/picom)
* **Bar:** [polybar](https://github.com/polybar/polybar)
* **App launcher:** [rofi](https://github.com/davatorium/rofi)
* **Terminal:** [kitty](https://github.com/kovidgoyal/kitty) with [Challenger Deep](https://challenger-deep-theme.github.io) colors
* **Editor:** [neovim](https://github.com/neovim/neovim) with [Challenger Deep](https://challenger-deep-theme.github.io) colors & custom statusline
* **Notifications:** [dunst](https://github.com/dunst-project/dunst)
* **Wallpaper:** [Mountains](https://unsplash.com/photos/k6Z_CKxk1wQ)


## Installation
The Makefile is theoretical and hasn't been tested yet, so use at your own risk.

1. Install everything at once with `make all` or individual components with `make <xxxxxx>`. Refer to [Makefile](Makefile) for options.
2. Some settings are system specific and may require updating:
    * **~/.Xresources`** - _dpi_ - display scaling
    * **~/.config/i3/config** - _gaps_ - gaps size between tiled windows
    * **~/.config/i3/config** - _exec --no-startup-id feh_ - points to your wallpaper
    * **~/scripts/lock.sh** _i3lock_ - points to your lock screen wallpaper
    * **~/.config/polybar/modules/backlight.ini** - _card_ - based on output of `ls -1 /sys/class/backlight/`
    * **~/.config/polybar/modules/battery.ini** - _battery_ & _adapter_ - based on output of `ls -1 /sys/class/power_supply/`
    * **~/.config/polybar/modules/network.ini** - _interface_ - based on output of `iwctl device list`
3. Restart to ensure all changes take effect.

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
| <kbd>super shift space</kbd> | Display power menu |
| <kbd>super enter</kbd> | Launch terminal |
| <kbd>super r</kbd> + <kbd>arrow</kbd> | Resize floating window |
| <kbd>super shift arrow</kbd> | Move floating window |
| <kbd>super f</kbd> | Toggle full screen |
| <kbd>super shift l</kbd> | Lock screen |
| <kbd>super -</kbd> | Minimize window to scratchpad |
| <kbd>super +</kbd> | Maximixe window from scratchpad |

### tmux
| Keybinding | Description |
| ---------- | ----------- |
| <kbd>control a</kbd> | The tmux prefix, which must be pressed & released to initiate a tmux command  |
| <kbd>control a</kbd> + <kbd>c</kbd> | Create a new window  |
| <kbd>control a</kbd> + <kbd>n</kbd> | Navigate to the next window  |
| <kbd>control a</kbd> + <kbd>p</kbd> | Navigate to the previous window  |
| <kbd>control a</kbd> + <kbd>number</kbd> | Navigate to the window corresponding to the number |
| <kbd>control a</kbd> + <kbd>v</kbd> | Create a new vertical pane |
| <kbd>control a</kbd> + <kbd>_</kbd> | Create a new horizontal pane |
| <kbd>control a</kbd> + <kbd>v</kbd> | Arrange panes vertically and evenly |
| <kbd>control a</kbd> + <kbd>h</kbd> | Navgiate to the pane left of current pane |
| <kbd>control a</kbd> + <kbd>j</kbd> | Navgiate to the pane below current pane |
| <kbd>control a</kbd> + <kbd>k</kbd> | Navgiate to the pane above current pane |
| <kbd>control a</kbd> + <kbd>l</kbd> | Navgiate to the pane right of current pane |

### neovim
| Keybinding | Description |
| ---------- | ----------- |
| <kbd>space</kbd> | The Leader, used to initiate various actions |
| <kbd>space f</kbd> | Display file fuzzy finder |
| <kbd>space b</kbd> | Display buffer fuzzy finder |
| <kbd>space g</kbd> | Display grep fuzzy finder |
| <kbd>space c</kbd> | Display git commit fuzzy finder |
| <kbd>space q</kbd> | Display quickfix fuzzy finder |
| <kbd>space r</kbd> | Display register fuzzy finder |
| <kbd>alt t</kbd> | Send fuzzy finder results to quickfix |
| <kbd>space e</kbd> | Toggle file tree |
| <kbd>space j</kbd> | Format JSON object |
| <kbd>space z</kbd> | Toggle zen mode |
| <kbd>gd</kbd> | LSP go to definition |
| <kbd>gD</kbd> | LSP go to declaration |
| <kbd>gh</kbd> | LSP trigger hover |
| <kbd>gf</kbd> | LSP format buffer |
| <kbd>gr</kbd> | LSP list references |
| <kbd>gr</kbd> | LSP rename all references |
| <kbd>[d</kbd> | LSP go to previous diagnostic |
| <kbd>]d</kbd> | LSP go to next diagnostic |


