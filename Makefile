ubuntu: apt-update xws i3 zsh tmux git python neovim polybar end

apt-update:
	echo 'Updating packages...'
	sudo apt update
	echo 'Completed package updates!'

zsh: apt-update
	echo 'Configuring zsh...'
	sudo apt install zsh ripgrep silversearcher-ag bat
	chsh -s /bin/zsh
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k || true
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting || true
	[ -f "~/.zshrc" ] && mv ~/.zshrc ~/.zshrc-%Y%m%dT%H%M%S
	cp ./.zshrc ~/.zshrc
	echo 'Completed zsh configuration!'

xws:
	echo 'Configuring X window system'
	[ -f "~/.Xresources" ] && mv ~/.xResources ~/.XResources-%Y%m%dT%H%M%S
	cp ./.Xresources ~/.Xresources
	[ -f "~/.xbindkeysrc" ] && mv ~/.xbindkeysrc ~/.xbindkeysrc-%Y%m%dT%H%M%S
	cp ./.xbindkeysrc ~/.xbindkeysrc
	[ -f "/etc/X11/xorg.conf.d/90-touchpad.conf" ] && sudo mv /etc/X11/xorg.conf.d/90-touchpad.conf /etc/X11/xorg.conf.d/90-touchpad.conf-%Y%m%dT%H%M%S
	sudo cp ./90-touchpad.conf /etc/X11/xorg.conf.d/90-touchpad.conf
	[ -f "/etc/udev/rules.d/90-backlight.rules" ] && sudo mv /etc/udev/rules.d/90-backlight.rules /etc/udev/rules.d/90-backlight.rules-%Y%m%dT%H%M%S
	sudo cp ./90-backlight.rules /etc/udev/rules.d/90-backlight.rules	
	echo 'Completed x window system configuration'

i3: apt-update
	echo 'Configuring i3...'
	sudo apt install i3-gaps compton feh xbindkeys
	mkdir -p ~/.conf/i3 || true
	[ -f "~/.conf/i3/config" ] && mv ~/.conf/i3/config ~/.conf/i3/config-%Y%m%dT%H%M%S
	cp ./.conf/i3/config ~/.conf/i3/config
	echo 'Completed i3 configuration!'

tmux: apt-update xws
	echo 'Configuring tmux...'
	sudo apt install tmux
	[ -f "~/.tmux.conf" ] && mv ~/.tmux.conf ~/.tmux.conf-%Y%m%dT%H%M%S
	cp ./.tmux.conf ~/.tmux.conf
	echo 'Completed tmux configuration!'

git: apt-update
	echo 'Configuring git...'
	sudo apt install git
	[ -f "~/.gitconfig" ] && mv ~/.gitconfig ~/.gitconfig-%Y%m%dT%H%M%S
	cp ./.gitconfig ~/.gitconfig
	echo 'Completed git configuration!'

python: apt-update
	echo 'Configuring python...'
	sudo apt install python3 python3-pip python3-venv
	python3 -m venv ~/sandbox
	echo 'Completed python configuration!'

neovim: apt-update
	echo 'Configuring neovim...'
	sudo apt install neovim xclip nodejs
	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' || true
	mkdir -p ~/.config/nvim || true
	[ -f "~/.config/nvim/init.vim" ] && mv ~/.config/nvim/init.vim ~/.config/nvim/init.vim-%Y%m%dT%H%M%S
	cp ./.config/nvim/init.vim ~/.config/nvim/init.vim
	[ -f "~/.config/nvim/coc-settings.json" ] && mv ~/.config/nvim/coc-settings.json ~/.config/nvim/coc-settings.json-%Y%m%dT%H%M%S
	cp ./.config/nvim/coc-settings.json ~/.config/nvim/coc-settings.json
	nvim --headless +PlugInstall +qa
	nvim --headless +CocInstall coc-python coc-yaml coc-json coc-tsserver coc-html coc-css coc-explorer +qa
	echo 'Completed neovim configuration!'

polybar: xws
	echo 'Configuring polybar...'
	sudo add-apt-repository ppa:kgilmer/speed-ricer
	make apt-update
	sudo apt install polybar
	mkdir -p ~/.config/polybar || true
	[ -d "~/.config/polybar" ] && mv ~/.config/polybar ~/.config/polybar-%Y%m%dT%H%M%S
	cp -r ./.config/polybar ~/.config
	chmod +x ~/.config/polybar/launch.sh
	'Completed polybar configuration!'

end:
	echo -e '\nCompleted all configurations!'

