# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="amuse"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    zsh-interactive-cd
    docker
    docker-compose
)

source $ZSH/oh-my-zsh.sh

export PATH="~/scripts:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export EDITOR='vim'

# Edit config
alias edz="vim ~/.zshrc"
alias rez="source ~/.zshrc"
alias edt="vim ~/.tmux.conf"
alias edv="vim ~/.vimrc"
alias eda="vim ~/.aws/config"
# Navigation
alias ll="ls -lAh --color"
alias ch="cd ~"
alias cs="cd ~/src"
alias ct="cd ~/tmp"
alias cdoc="cd ~/Documents"
alias cdot="cd ~/.dotfiles"
# Git
alias gn="git new"
alias pushall="make black && make flake8 && gaa && gc && gp"
alias pruneall="git branch -vv | grep gone | awk '{ print $1 }' | xargs git branch -D"
alias gf="~/.dotfiles/scripts/git_find_checkout.sh"
alias gcf='git checkout $(git branch -a | tr -d '\'' *'\'' | grep -v '\''^remotes/origin/'\'' | fzf --preview '\''git log --color master..{} --oneline'\'' --preview-window '\''down'\'')'
alias fcommit="fzf --header 'Select a commit' --preview 'echo {} | cut -f1 -d\" \" | xargs git show --compact-summary' --reverse --preview-window=down"
# GH
alias fpr="sed 's/\w{2,}/\t/' | column -s $'\t' -t | fzf --header 'Select a PR' --preview 'echo {} | cut -f1 -d'\'' '\'' | xargs gh pr view' --reverse --preview-window=down"
alias lpr="gh pr list | sed 's/\w{2,}/\t/' | column -t -s $'\t' | fpr"

# Scripts
alias watch="~/scripts/watch.sh"
# AWS
alias awslocal="aws --endpoint-url=http://localhost:4566"
# Misc
alias docker-compose="docker compose"
alias flog='docker compose ps | fzf -m --header '\''Select container'\'' --preview '\''docker container logs $(echo {} | cut -d" " -f1)'\'' --reverse --preview-window=down,follow | cut -d" " -f1 | xargs docker container logs -f'
alias fcont='docker container ls | fzf -m --header '\''Select container'\'' --preview '\''docker container logs $(echo {} | cut -d" " -f1)'\'' --reverse --preview-window=down,follow | awk '\''{print $1}'\'''

alias fman='compgen -c | fzf -m --header '\''Select command'\'' --preview '\''man {}'\'' --reverse --preview-window=down | xargs man'


#### Path and other env vars ####
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Python
export PATH="$(brew --prefix)/opt/python@3.11/libexec/bin:$PATH"

# Created by `pipx` on 2023-02-23 08:40:06
export PATH="$PATH:/Users/krzysztof/.local/bin"

# For pipx autocompletion
autoload -U bashcompinit
bashcompinit

# Autocompletion; requires fzf and zsh-autosuggestions to be installed
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
