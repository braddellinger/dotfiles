all: backup dirs pacman yay zsh dots scripts fonts x11 neovim

backup:
	mkdir ~/backup_YYYYMMDDTHHMMDD
	cp -r ~ ~/backup_YYYYMMDDTHHMMDD
	rm ~/*

dirs:
	mkdir ~/Documents
	mkdir ~/Downloads
	mkdir ~/screenshots
	mkdir ~/wallpapers
	mkdir ~/github

pacman:
	sudo pacman -S git zsh python python-pip ripgrep the_silver_searcher bat fzf \
	zsh-syntax-highlighting xorg-server xorg-xinit xorg-xbacklight xorg-xrandr \
	xbindkeys xclip i3-gaps feh redshift rofi tmux neovim nodejs npm dunst \
	kitty flameshot papirus-icon-theme thunar brave udiskie ntfs-3g 

yay:
	git clone https://aur.archlinux.org/yay.git ~/github
	cd ~/github/yay && makepkg -si && cd ~
	yay -S picom-ibhagwan-git vim-plug polybar git-delta

zsh:
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/github
	chsh -s /bin/zsh

dots:
	git clone --separate-git-dir=~/github/dotfiles https://github.com/braddellinger/dotfiles.git ~
	source ~/.zshrc
	git --git-dir=~/github/dotfiles --work-tree=~ config status.showUntrackedFiles no

scripts:
	chmod +x ~/scripts/lock.sh
	chmod +x ~/scripts/powermenu.sh
	chmod +x ~/scripts/polybar.sh

fonts:
	git clone https://github.com/ryanoasis/nerd-fonts.git ~/github
	~/github/nerd-fonts/install.sh Inconsolata
	~/github/nerd-fonts/install.sh FiraMono

x11:
	[ -f "/etc/X11/xorg.conf.d/90-touchpad.conf" ] && sudo mv /etc/X11/xorg.conf.d/90-touchpad.conf /etc/X11/xorg.conf.d/90-touchpad.conf_%Y%m%dT%H%M%S
	sudo cp ./90-touchpad.conf /etc/X11/xorg.conf.d/90-touchpad.conf
	[ -f "/etc/X11/xorg.conf.d/95-dpms.conf" ] && sudo mv /etc/X11/xorg.conf.d/95-dpms.conf /etc/X11/xorg.conf.d/95-dpms.conf_%Y%m%dT%H%M%S
	sudo cp ./95-dpms.conf /etc/X11/xorg.conf.d/95-dpms.conf
	[ -f "/etc/udev/rules.d/90-backlight.rules" ] && sudo mv /etc/udev/rules.d/90-backlight.rules /etc/udev/rules.d/90-backlight.rules_%Y%m%dT%H%M%S
	sudo cp ./90-backlight.rules /etc/udev/rules.d/90-backlight.rules
	gpasswd -a $USER video

neovim:
	nvim --headless +PlugInstall +qa

