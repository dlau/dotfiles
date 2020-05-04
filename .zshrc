# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME=simple

#Path modification
export PATH=$PATH:/usr/local/share/npm/bin
#Give priority to /usr/local/bin
export PATH=/usr/local/bin:$PATH
export PATH=/Developer/NVIDIA/CUDA-5.5/bin:$PATH
export PATH=$PATH:node_modules/.bin:$PATH
export PATH=/usr/local/opt/gnu-sed/libexec/gnubin:$PATH

#Aliases
alias ll="ls -al"
alias vim=nvim
alias vi=nvim
alias frsync=rsync --iconv=utf-8-mac,utf-8 -aHAXxv --numeric-ids --delete --progress -e "ssh -T -c arcfour -o Compression=no -x"

#Vi bash mode
bindkey -v

#Delay between ESC and mode change
export KEYTIMEOUT=1

# User configuration
plugins=(git, vi-mode)


source $ZSH/oh-my-zsh.sh

#http://zshwiki.org/home/zle/vi-mode
bindkey -v
export KEYTIMEOUT=1
function zle-line-init zle-keymap-select {
  RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
  RPS2=$RPS1
  zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

bindkey -a u undo
bindkey -a '^R' redo
bindkey '^?' backward-delete-char

unsetopt share_history
setopt no_share_history

# ASCII art welcome screen

if hash cowsay &>/dev/null && hash fortune &>/dev/null; then
  print '\r\n'
  fortune -s | cowsay -f hellokitty | awk '{printf("\t\t\t%s\n", $0)}'
  print '\r\n'
fi

# RVM

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 


# Go Specific

export GOPATH=~/dev/go
export PATH=$PATH:$GOPATH/bin


# Haskell stack
export PATH=$PATH:~/.local/bin


# Fuzzy finder

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# Extra 
#source ~/.zsh/plugins/opp.zsh/opp.zsh
#source ~/.zsh/plugins/opp.zsh/opp/surround.zsh

export TERM=screen-256color

#Modules
autoload -U zmv

export PATH="$HOME/Library/Haskell/bin:$PATH"

source /Users/dlau/.rvm/scripts/rvm

 export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm

if [ -e "$HOME/env/etc/indeed_profile" ]; then
    . "$HOME/env/etc/indeed_profile"
fi

if [ -d "$HOME/env/bin" ]; then
    PATH="$HOME/env/bin:$PATH"
fi


# Add dev tool binaries to path
if [ -d "$HOME/.indeed-dev-tools/bin" ]; then
    PATH="$HOME/.indeed-dev-tools/bin:$PATH"
fi


[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools

unsetopt nomatch
eval "$(pyenv init -)"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
eval $(docker-machine env "hobo-vb-default")

export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

export PYTHONPATH=$HOME/indeed/shield/products:$PYTHONPATH
export PYTHONPATH=$HOME/indeed/shield/products/pyprotos/clients:$PYTHONPATH

# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
