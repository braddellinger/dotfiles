all: git yay fonts zsh xws i3 picom redshift rofi tmux neovim polybar dunst kitty ancillary optional

yay:
	echo 'Configuring yay...'
	git clone https://aur.archlinux.org/yay.git ~/github || true
	cd ~/github/yay
	makepkg -si
	cd ~
	echo ' Completed yay configuration!'

git:
	echo 'Configuring git...'
	sudo pacman -S git
	[ -f "~/.gitconfig" ] && mv ~/.gitconfig ~/.gitconfig-%Y%m%dT%H%M%S
	cp ./.gitconfig ~/.gitconfig
	echo 'Completed git configuration!'

fonts:
	echo 'Configuring fonts...'
	mkdir -p ~/github || true
	git clone https://github.com/ryanoasis/nerd-fonts.git ~/github || true
	~/github/nerd-fonts/install.sh Inconsolata
	~/github/nerd-fonts/install.sh FiraMono
	echo 'Completed font configuration!'

zsh:
	echo 'Configuring zsh...'
	sudo pacman -S zsh ripgrep the_silver_searcher bat fzf zsh-syntax-highlighting zsh-autosuggestions
	chsh -s /bin/zsh
	yay -S zsh-theme-powerlevel10k-git 
	[ -f "~/.zshrc" ] && mv ~/.zshrc ~/.zshrc-%Y%m%dT%H%M%S
	cp ./.zshrc ~/.zshrc
	echo 'Completed zsh configuration!'

xws:
	echo 'Configuring X window system...'
	sudo pacman -S xorg-server xorg-xinit xorg-xbacklight xbindkeys xclip
	[ -f "~/.xinitrc" ] && mv ~/.xinitrc ~/.xinitrc-%Y%m%dT%H%M%S
	cp ./.xinitrc ~/.xinitrc
	[ -f "~/.Xresources" ] && mv ~/.xResources ~/.XResources-%Y%m%dT%H%M%S
	cp ./.Xresources ~/.Xresources
	[ -f "~/.xbindkeysrc" ] && mv ~/.xbindkeysrc ~/.xbindkeysrc-%Y%m%dT%H%M%S
	cp ./.xbindkeysrc ~/.xbindkeysrc
	[ -f "/etc/X11/xorg.conf.d/90-touchpad.conf" ] && sudo mv /etc/X11/xorg.conf.d/90-touchpad.conf /etc/X11/xorg.conf.d/90-touchpad.conf-%Y%m%dT%H%M%S
	sudo cp ./90-touchpad.conf /etc/X11/xorg.conf.d/90-touchpad.conf
	echo 'Completed X window system configuration!'

i3:
	echo 'Configuring i3...'
	sudo pacman -S i3-gaps feh
	[ -d "~/.config/i3" ] && mv ~/.config/i3 ~/.config/i3-%Y%m%dT%H%M%S
	cp -r ./.config/i3 ~/.config
	echo 'Completed i3 configuration!'

picom:
	echo 'Configuring picom...'
	yay -S picom-ibhagwan-git
	[ -d "~/.config/picom" ] && mv ~/.config/picom ~/.config/picom-%Y%m%dT%H%M%S
	cp -r ./.config/picom ~/.config
	echo 'Completed picom configuration!'

redshift:
	echo 'Configuring redshift...'
	sudo pacman -S redshift
	[ -d "~/.config/redshift" ] && mv ~/.config/redshift ~/.config/redshift-%Y%m%dT%H%M%S
	cp -r ./.config/redshift ~/.config
	echo 'Completed redshift configuration!'

rofi:
	echo 'Configuring rofi...'
	sudo pacman -S rofi
	[ -d "~/.config/rofi" ] && mv ~/.config/rofi ~/.config/rofi-%Y%m%dT%H%M%S
	cp -r ./.config/rofi ~/.config
	echo 'Completed rofi configuration!'

tmux:
	echo 'Configuring tmux...'
	sudo pacman -S tmux
	[ -f "~/.tmux.conf" ] && mv ~/.tmux.conf ~/.tmux.conf-%Y%m%dT%H%M%S
	cp ./.tmux.conf ~/.tmux.conf
	echo 'Completed tmux configuration!'

neovim:
	echo 'Configuring neovim...'
	sudo pacman -S neovim nodejs npm
	yay -S vim-plug
	[ -d "~/.config/nvim" ] && mv ~/.config/nvim ~/.config/nvim-%Y%m%dT%H%M%S
	cp -r ./.config/nvim ~/.config
	nvim --headless +PlugInstall +qa
	nvim --headless +CocInstall coc-python coc-yaml coc-json coc-tsserver coc-html coc-css coc-explorer +qa
	echo 'Completed neovim configuration!'

polybar:
	echo 'Configuring polybar...'
	yay -S polybar
	[ -d "~/.config/polybar" ] && mv ~/.config/polybar ~/.config/polybar-%Y%m%dT%H%M%S
	cp -r ./.config/polybar ~/.config
	echo 'Completed polybar configuration!'

dunst:
	echo 'Configuring dunst...'
	sudo pacman -S dunst
	[ -d "~/.config/dunst" ] && mv ~/.config/dunst ~/.config/dunst-%Y%m%dT%H%M%S
	cp -r ./.config/dunst ~/.config
	echo 'Completed dunst configuration!'

kitty:
	echo 'Configuring kitty...'
	sudo pacman -S kitty
	[ -d "~/.config/kitty" ] && mv ~/.config/kitty ~/.config/kitty-%Y%m%dT%H%M%S
	cp -r ./.config/kitty ~/.config
	echo 'Completed kitty configuration!'

ancillary:
	echo 'Configuring ancillary resources...'
	sudo pacman -S maim papirus-icon-theme
	echo 'Completed ancillary resource configurations!'

optional:
	echo 'Configuring optional resources...'
	sudo pacman -S firefox google-chrome thunar
	echo 'Completed optional reosurce configurations!'

