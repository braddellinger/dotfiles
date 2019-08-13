# local-setup
Local setup made easy.

### Setup Steps
1. Install & configure [nerdfont](https://www.nerdfonts.com/)
2. Install & configure [git](https://www.atlassian.com/git/tutorials/install-git)
3. Install & configure shell
    1. Install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
    2. Install [powerlevel9k](https://github.com/Powerlevel9k/powerlevel9k)
    3. Copy .zshrc: `cp ./.zshrc ~/.zshrc`
    4. Install [fzf](https://github.com/junegunn/fzf)
    5. Install [ag / silver_searcher](https://github.com/ggreer/the_silver_searcher)
    6. Install ctags (steps differ depending on OS)
    7. Copy .ctags: `cp ./.ctags ~/.ctags` 
4. Install & configure [python3](https://realpython.com/installing-python/). To install python3 for Ubuntu or Debian, as well as setup a virtual environment, follow below steps.
```
sudo apt install python3 python3-pip python3-venv
python3 -m venv ~/sandbox
. ~/sandbox/bin/activate
pip3 install requests flask click boto
deactivate
```
5. Install & configure NeoVim
    1. Install [NeoVim](https://neovim.io/)
    2. Install [vim-plug](https://github.com/junegunn/vim-plug)
    3. Install and configure [coc.vim](https://github.com/neoclide/coc.nvim)
    4. Copy init.vim: `cp ./init.vim ~/config/nvim/init.vim`
    5. Open nvim & install plugins: `:PlugInstall`
6. Install & configure VS Code
    1. Install [VS Code](https://code.visualstudio.com/)
    2. Copy settings.json: `cp ./vscode_settings.json ~/.config/Code/User/settings.json`
7. Install [Insomnia](https://insomnia.rest/)
8. Install & configure [Docker](https://docs.docker.com/install/)

