# zsh & powerlevel10k
########################
ZSH_THEME="powerlevel10k/powerlevel10k"
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
########################
function sandbox {
    . ~/sandbox/bin/activate
}

# aliases
########################
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'
alias g='git'
alias gs='git status'

# exports
########################
export PATH=$HOME:$PATH
export ZSH=$HOME/.oh-my-zsh
export EDITOR=nvim
export BAT_THEME=TwoDark

# start tmux
########################
[ -z $TMUX ] && tmux new-session -As 0

# source
########################
source $ZSH/oh-my-zsh.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
