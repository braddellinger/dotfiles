# Powerlevel10k
########################################
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(background_jobs virtualenv dir vcs)
POWERLEVEL9K_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL=" "
POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=' '
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=''
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_VCS_GIT_GITHUB_ICON='ﯙ'
POWERLEVEL9K_DISABLE_PROMPT=true
POWERLEVEL9K_VCS_BRANCH_ICON=''
POWERLEVEL9K_HOME_SUB_ICON=''
POWERLEVEL9K_PYTHON_ICON=''
POWERLEVEL9K_FOLDER_ICON=''
POWERLEVEL9K_HOME_ICON=''
# POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='  '  # 勞
# POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX=''
# POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=''
# POWERLEVEL9K_PROMPT_ON_NEWLINE=true


# Aliases
########################################
alias dots='git --git-dir=$HOME/github/dotfiles --work-tree=$HOME'
alias sandbox='source ~/sandbox/bin/activate'
alias eww='~/github/eww/target/release/eww'
alias startgnome='startx ~/.xinitrc gnome'
alias starti3='startx ~/.xinitrc i3'
alias e='exa -las modified --icons'
alias nvim='~/nvim.appimage'
alias open='xdg-open'
alias gs='git status'
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'
alias g='git'


# Exports
########################################
export GOPATH=$HOME/go
export PATH=$HOME:$GOPATH/bin:$HOME/.cargo/bin:$PATH
export EDITOR=nvim


# Start tmux automatically but only
# if a graphical environment is running
########################################
if [[ $DISPLAY ]]; then
    [[ $- != *i* ]] && return
    [ -z $TMUX ] && tmux new-session -As 0
fi


# Source
########################################
source ~/.oh-my-zsh/oh-my-zsh.sh
source ~/github/powerlevel10k/powerlevel10k.zsh-theme
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# Set cursor by referencing number (below).
# Necessary because neovim changes cursor.
# 0 - blinking block
# 1 - blinking block
# 2 - steady block
# 3 - blinking underline
# 4 - steady underline
# 5 - blinking beam
# 6 - steady beam
########################################
printf '\e[4 q'
