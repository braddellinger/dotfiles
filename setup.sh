# git
git config credential.helper store

# shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
$ git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
cp ./.zshrc ~/.zshrc
. ~/.zshrc

# python
python3 -m venv ~/sandbox
. ~/sandbox/bin/activate
pip3 install requests
deactivate

# complete
echo 'Setup complete!'