# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

fpath=(/opt/boxen/homebrew/share/zsh/site-functions $fpath)

source $ZSH/oh-my-zsh.sh

## Make sure the brew stuff is before the builtins (eg. ctags)
export PATH=/usr/local/share/npm/bin:/usr/local/bin:$PATH:~/bin

# Set editors
EDITOR="/Applications/MacVim.app/Contents/MacOS/Vim"
export BUNDLER_EDITOR="/Applications/MacVim.app/Contents/MacOS/Vim"
export GEMEDITOR="vim"

if [ -e $HOME/.env_keys ]; then
  source $HOME/.env_keys
fi

export LANG="en_US.UTF-8"
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
# export LC_ALL=da_DK.UTF-8

function dns {
  dig $1 @$2 a +short
}


function gemedit {
  cd `bundle show $1`
  vim .
  cd -
}


# 
export LSCOLORS=gxfxcxdxbxegedabagacad

function ci() {
  if [ -n "$1" ]; then 
    git commit -m "$*"
  else
    git commit
  fi
}


PROMPT='%{$fg_bold[red]%}➜ %{$fg_bold[green]%}%p %{$fg[cyan]%}%d %{$fg_bold[blue]%}%{$fg_bold[blue]%} % %{$reset_color%}'
unsetopt correct_all

CDPATH=.:/Users/jtj/c

export PATH=bin:/usr/local/share/npm/bin:$PATH

function editconflicts() { 
  vim +/"<<<<<<<" $( git diff --name-only --diff-filter=U | xargs )
}

source $HOME/.aliases

__git_files () { 
  _wanted files expl 'local files' _files  
}

source /opt/boxen/env.sh
eval "$(rbenv init -)"
