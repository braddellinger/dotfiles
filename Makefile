all: apt-update zsh tmux git python neovim

apt-update:
	echo 'Updating packages...'
	sudo apt update # update packages

zsh: apt-update
	echo 'Configuring zsh...'
	sudo apt install zsh ripgrep silversearcher-ag bat # install zsh, ripgrep, silversearcher-ag bat
	chsh -s /bin/zsh # set zsh as default
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" # install oh-my-zsh
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k # install powerlevel10k
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting # install zsh-syntax-highlighting
	cp ./.zshrc ~/.zshrc # copy zsh dotfile

tmux: apt-update
	echo 'Configuring tmux...'
	sudo apt install tmux # install tmux
	cp ./.tmux.conf ~/.tmux.conf # copy tmux dotfile

git: apt-update
	echo 'Configuring git...'
	sudo apt install git # install git
	cp ./.gitconfig ~/.gitconfig # copy git dotfile

python: apt-update
	echo 'Configuring python...'
	sudo apt install python3 python3-pip python3-venv # install python
	python3 -m venv ~/sandbox # create virtual python env
	source ~/sandbox/bin/activate # activate env
	pip3 install neovim requests flask click boto # install common python packages
	deactivate # deactivate env

neovim: apt-update node
	echo 'Configuring neovim...'
	sudo apt install neovim xclip # install neovim
	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' # install vim-plug
	cp ./.config/nvim/init.vim ~/.config/nvim/init.vim # copy neovim dotfile
	cp ./.config/nvim/coc-settings.json ~/.config/nvim/coc-settings.json # copy coc-settings
	nvim --headless +PlugInstall +qa # install neovim plugins
	nvim --headless +CocInstall coc-python coc-yaml coc-json coc-tsserver coc-html coc-css coc-explorer +qa # install neovim coc plugins

node: apt-update
	echo 'Configuring node...'
	sudo apt install nodejs npm # install nodejs, npm
