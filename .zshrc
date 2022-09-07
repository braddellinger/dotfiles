POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(background_jobs virtualenv dir vcs)
POWERLEVEL9K_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL=' '
POWERLEVEL9K_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL=' '
POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=' '
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=' '
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_VCS_GIT_GITHUB_ICON='ﯙ '
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_DISABLE_PROMPT=true
POWERLEVEL9K_VCS_BRANCH_ICON=''
POWERLEVEL9K_HOME_SUB_ICON=' '
POWERLEVEL9K_PYTHON_ICON=''
POWERLEVEL9K_FOLDER_ICON=' '
POWERLEVEL9K_HOME_ICON=' '
# POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='  '  # 勞
# POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX=''
# POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=''
# POWERLEVEL9K_PROMPT_ON_NEWLINE=true


export GOPATH=$HOME/go
export PATH=$HOME:$GOPATH/bin:$HOME/.cargo/bin:$PATH
export EDITOR=nvim


alias glow='glow -s ~/.config/glow/draculaStyle.json'
alias sandbox='source ~/sandbox/bin/activate'
alias e='exa -las modified --icons'
alias gpo='git push origin'
alias gs='git status'
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'
alias g='git'


if [[ `uname` == "Linux" ]]; then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    source ~/github/powerlevel10k/powerlevel10k.zsh-theme

    alias dots='git --git-dir=$HOME/github/dotfiles --work-tree=$HOME'
    alias eww='~/github/eww/target/release/eww'
    alias startgnome='startx ~/.xinitrc gnome'
    alias starti3='startx ~/.xinitrc i3'
    alias nvim='~/nvim.appimage'
    alias open='xdg-open'

    if [[ $DISPLAY ]]; then
       [[ $- != *i* ]] && return
       [ -z $TMUX ] && tmux new-session -As 0
    fi
elif [[ `uname` == "Darwin" ]]; then
    source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme

    [ -z $TMUX ] && tmux new-session -As 0
fi


# Command completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit && compinit


# Command & history navigation
# Get bindkey identifier by executing `cat` followed by key combo
HISTFILE=$HOME/.zsh_history
SAVEHIST=1000
HISTSIZE=1000
setopt hist_expire_dups_first # Delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_space      # Ignore commands that start with space
setopt extended_history       # Record timestamp of command in HISTFILE
setopt hist_ignore_dups       # Ignore duplicated commands history list
setopt share_history          # Share command history data
setopt hist_verify            # Show command with history expansion to user before running it
bindkey '\e[A' history-search-backward # 
bindkey '\e[B' history-search-forward  # 
bindkey '\e[1;3D' backward-word        # ⌥←
bindkey '\e[1;3C' forward-word         # ⌥→


# Set cursor by referencing number (below).
# Necessary because neovim changes cursor.
# 0 - blinking block
# 1 - blinking block
# 2 - steady block
# 3 - blinking underline
# 4 - steady underline
# 5 - blinking beam
# 6 - steady beam
printf '\e[4 q'
