# dotfiles
Dotfiles & local setup steps for Debian-based distros. Depending on OS, the steps may vary.

### Setup Steps
1. Install & configure [nerdfont](https://www.nerdfonts.com/). Preferred fonts include:
    - Inconsolata
    - FiraMono
2. Install & configure [git](https://www.atlassian.com/git/tutorials/install-git)
3. Install & configure shell
    1. Set default shell to zsh: `chsh -s /bin/zsh`
    2. Copy .zshrc: `cp ./.zshrc ~/.zshrc`
    3. Install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
    4. Install [powerlevel10k](https://github.com/romkatv/powerlevel10k)
    5. Install [zsh syntax highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
    6. Install [fzf](https://github.com/junegunn/fzf)
    7. Install [rg / ripgrep](https://github.com/BurntSushi/ripgrep)
    8. Install [ag / silver_searcher](https://github.com/ggreer/the_silver_searcher)
4. Install & configure Tmux
    1. Install tmux: `sudo apt install tmux`
    2. Copy .tmux.conf: `cp ./.tmux.conf ~/.tmux.conf`
5. Install & configure [python3](https://realpython.com/installing-python/). To install python3 for Ubuntu or Debian, as well as setup a virtual environment, follow below steps.
    ```
    sudo apt install python3 python3-pip python3-venv
    python3 -m venv ~/sandbox
    . ~/sandbox/bin/activate
    pip3 install neovim requests flask click boto
    deactivate
    ```
6. Install & configure NeoVim
    1. Install [NeoVim](https://neovim.io/)
    2. Install xclip to enable NeoVim to interact with system clipboard: `sudo apt install xclip`
    3. Install [vim-plug](https://github.com/junegunn/vim-plug)
    4. Install and configure [coc.vim](https://github.com/neoclide/coc.nvim)
    5. Copy init.vim: `cp ./.config/nvim/init.vim ~/.config/nvim/init.vim`
    6. Copy coc-settings.json: `cp ./.config/nvim/coc-settings.json ~/.config/nvim/coc-settings.json`
    7. Open nvim & install plugins: `:PlugInstall`
7. Install & configure VS Code
    1. Install [VS Code](https://code.visualstudio.com/)
    2. Copy settings.json: `cp ./.config/Code/User/settings.json ~/.config/Code/User/settings.json`
8. Install [Insomnia](https://insomnia.rest/)
9. Install & configure [Docker](https://docs.docker.com/install/)

