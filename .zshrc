# Path to your oh-my-zsh configuration.
#ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME=simple

#Path modification
export PATH=$PATH:/usr/local/share/npm/bin
#Give priority to /usr/local/bin
export PATH=/usr/local/bin:$PATH
export PATH=/Developer/NVIDIA/CUDA-5.5/bin:$PATH
export PATH=$PATH:node_modules/.bin:$PATH

#Aliases
alias ll="ls -al"
alias frsync=rsync --iconv=utf-8-mac,utf-8 -aHAXxv --numeric-ids --delete --progress -e "ssh -T -c arcfour -o Compression=no -x"

#Vi bash mode
bindkey -v

#Delay between ESC and mode change
export KEYTIMEOUT=1

[ -s $HOME/.nvm/nvm.sh ] && . $HOME/.nvm/nvm.sh # This loads NVM

# User configuration

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[green]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# show git branch/tag, or name-rev if on detached head
parse_git_branch() {
  (command git symbolic-ref -q HEAD || command git name-rev --name-only --no-undefined --always HEAD) 2>/dev/null
}

# show red star if there are uncommitted changes
parse_git_dirty() {
  if command git diff-index --quiet HEAD 2> /dev/null; then
    echo "$ZSH_THEME_GIT_PROMPT_CLEAN"
  else
    echo "$ZSH_THEME_GIT_PROMPT_DIRTY"
  fi
}

# if in a git repo, show dirty indicator + git branch
git_custom_status() {
  local git_where="$(parse_git_branch)"
  [ -n "$git_where" ] && echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX${git_where#(refs/heads/|tags/)}$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

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

export PS1="%d $(git_custom_status):"


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

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/daryl/.nvm/versions/node/v7.9.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/daryl/.nvm/versions/node/v7.9.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/daryl/.nvm/versions/node/v7.9.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/daryl/.nvm/versions/node/v7.9.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
