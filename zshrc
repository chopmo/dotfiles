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

fpath=(/usr/local/share/zsh/site-functions $fpath)

source $ZSH/oh-my-zsh.sh

## Make sure the brew stuff is before the builtins (eg. ctags)
export PATH=/usr/local/smlnj/bin:/usr/local/share/npm/bin:/usr/local/bin:$PATH:~/bin

source /Library/PostgreSQL/9.5/pg_env.sh

## Add Android tools to path
export PATH=$PATH:/Users/jtj/adt-bundle-mac-x86_64-20140702/sdk/platform-tools:/Users/jtj/adt-bundle-mac-x86_64-20140702/sdk/tools

# Set editors
EDITOR="/Applications/MacVim.app/Contents/MacOS/Vim"
export EDITOR
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


function editconflicts() {
  vim +/"<<<<<<<" $( git diff --name-only --diff-filter=U | xargs )
}

source $HOME/.aliases

__git_files () {
  _wanted files expl 'local files' _files
}

eval "$(rbenv init -)"

MYSQL=/usr/local/mysql/bin
export PATH=$PATH:$MYSQL
export PATH=/opt/chefdk/bin:$PATH
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH

# $(boot2docker shellinit)

export PATH=./bin:$PATH

# export RUBY_HEAP_MIN_SLOTS=2000000
# export RUBY_HEAP_SLOTS_INCREMENT=500000
# export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
# export RUBY_GC_MALLOC_LIMIT=70000000
# export RUBY_FREE_MIN=100000

export GOMORE_DIR="/Users/jtj/c/gomore"


expand-aliases() {
  unset 'functions[_expand-aliases]'
  functions[_expand-aliases]=$BUFFER
  (($+functions[_expand-aliases])) &&
    BUFFER=${functions[_expand-aliases]#$'\t'} &&
    CURSOR=$#BUFFER
}

zle -N expand-aliases
bindkey '\e^E' expand-aliases
