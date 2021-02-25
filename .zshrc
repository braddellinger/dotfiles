# powerlevel10k
##########################################
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(background_jobs virtualenv dir vcs)
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=''
POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR='錄'
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
POWERLEVEL9K_HOME_ICON=' ﳐ'
POWERLEVEL9K_HOME_SUB_ICON=' '
POWERLEVEL9K_FOLDER_ICON=' '
POWERLEVEL9K_VCS_GIT_GITHUB_ICON=''
POWERLEVEL9K_VCS_BRANCH_ICON=''
POWERLEVEL9K_PYTHON_ICON=''
POWERLEVEL9K_DISABLE_PROMPT=true
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=''
POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX=''
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='  '  # 勞

# functions
##########################################
function sandbox {
    source ~/sandbox/bin/activate
}

# aliases
##########################################
alias exa='exa -las modified --icons'
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'
alias g='git'
alias gs='git status'
alias startgnome='startx ~/.xinitrc gnome'
alias starti3='startx ~/.xinitrc i3'
alias dots='git --git-dir=~/github/dotfiles --work-tree=~'
alias nvimv='~/nvim.appimage -u ~/.config/nvim/init.vim'
alias nvim='~/nvim.appimage -u ~/.config/nvim/init.lua'

# exports
##########################################
export PATH=$HOME:$PATH
export EDITOR=nvim
export BAT_THEME=TwoDark
export FZF_DEFAULT_OPTS='--layout=reverse'

# start tmux automatically but only
# if a graphical environment is running
##########################################
if [[ $DISPLAY ]]; then
    [[ $- != *i* ]] && return
    [ -z $TMUX ] && tmux new-session -As 0
fi

# source
##########################################
source ~/.oh-my-zsh/oh-my-zsh.sh
source ~/github/powerlevel10k/powerlevel10k.zsh-theme
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
