all: dirs pacman yay fonts shell dotfiles scripts neovim x11 eww manual

dirs:
	mkdir ~/documents
	mkdir ~/downloads
	mkdir ~/screenshots
	mkdir ~/wallpapers
	mkdir ~/github

pacman:
	sudo pacman -S git kitty tmux zsh zsh-syntax-highlighting ripgrep fd exa htop ranger neofetch dictd fortune jq --needed # terminal
	sudo pacman -S udiskie light rofi dunst redshift feh flameshot xss-lock papirus-icon-theme peek mpv code --needed # apps
	sudo pacman -S xorg-server xorg-xinit xorg-xbacklight xorg-xrandr xbindkeys xclip xdg-utils --needed # x11
	sudo pacman -S nodejs npm python --needed # dev

yay:
	git clone https://aur.archlinux.org/yay.git ~/github/yay
	cd ~/github/yay && makepkg -si && cd ~
	yay -S picom-ibhagwan-git neovim-nightly-bin git-delta awesome-git libinput-gestures i3lock-color i3-gaps-rounded-git dict-wn brave-bin

fonts:
	git clone https://github.com/ryanoasis/nerd-fonts.git ~/github/nerd-fonts
	~/github/nerd-fonts/install.sh Inconsolata
	~/github/nerd-fonts/install.sh FiraMono
	~/github/nerd-fonts/install.sh Lekton
	~/github/nerd-fonts/install.sh JetBrainsMono
	git clone http://github.com/google/material-design-icons.git ~/github/material-design-icons
	mkdir ~/.local/share/fonts/material && cp -r ~/github/material-design-icons/font/* ~/.local/share/fonts/material
	fc-cache -v

dotfiles:
	git clone --bare https://github.com/braddellinger/dotfiles.git ~/github/dotfiles
	git --git-dir=$HOME/github/dotfiles --work-tree=$HOME config --local status.showUntrackedFiles no
	git --git-dir=$HOME/github/dotfiles --work-tree=$HOME reset --hard
	source ~/.zshrc

shell:
	tic ~/xterm-256color-italic.terminfo
	git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/github/powerlevel10k
	chsh -s /bin/zsh

scripts:
	chmod +x ~/scripts/*.sh

neovim:
	git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
	nvim --headless +PackerInstall +qa
	sudo npm install -g pyright

x11:
	[ -f "/etc/X11/xorg.conf.d/90-touchpad.conf" ] && sudo mv /etc/X11/xorg.conf.d/90-touchpad.conf /etc/X11/xorg.conf.d/90-touchpad.conf_%Y-%m-%dT%H:%M:%S
	sudo cp ~/90-touchpad.conf /etc/X11/xorg.conf.d/90-touchpad.conf
	[ -f "/etc/X11/xorg.conf.d/95-dpms.conf" ] && sudo mv /etc/X11/xorg.conf.d/95-dpms.conf /etc/X11/xorg.conf.d/95-dpms.conf_%Y-%m-%dT%H:%M:%S
	sudo cp ~/95-dpms.conf /etc/X11/xorg.conf.d/95-dpms.conf
	[ -f "/etc/udev/rules.d/90-backlight.rules" ] && sudo mv /etc/udev/rules.d/90-backlight.rules /etc/udev/rules.d/90-backlight.rules_%Y-%m-%dT%H:%M:%S
	sudo cp ~/90-backlight.rules /etc/udev/rules.d/90-backlight.rules
	[ -f "/etc/X11/xorg.conf.d/00-keyboard.conf" ] && sudo mv /etc/X11/xorg.conf.d/00-keyboard.conf /etc/X11/xorg.conf.d/00-keyboard.conf_%Y-%m-%dT%H:%M:%S
	sudo cp ~/00-keyboard.conf /etc/X11/xorg.conf.d/00-keyboard.conf
	sudo gpasswd -a $USER video
	sudo gpasswd -a $USER input
	reboot

eww:
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	git clone https://github.com/elkowar/eww ~/github/eww
	cd ~/github/eww
	cargo build --release
	cd ~/github/eww/target/release
	chmod +x ./eww

manual:
	@echo ""
	@echo "After installation, perform the following:"
	@echo ""
	@echo "* Display - Update dpi in ~/.Xresources"
	@echo "* Redshift - Update lon & lat in ~/.config/redshift/redshift.conf"
	@echo "* Weather - Update key, lon & lat in ~/scripts/weather.sh"
	@echo "* Crontab - Run 'crontab -e' and insert '*/30 * * * * ~/scripts/weather.sh'"
