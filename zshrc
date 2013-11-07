# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

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
__git_files () { 
  _wanted files expl 'local files' _files  
}

alias git=hub

source $ZSH/oh-my-zsh.sh

## Make sure the brew stuff is before the builtins (eg. ctags)
export PATH=/usr/local/share/npm/bin:/usr/local/bin:$PATH:~/bin
# export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

alias vim=/Applications/MacVim.app/Contents/MacOS/Vim

# Aliases
alias ls="/bin/ls -G"
alias ll="ls -laGFh"
alias reinit="source ~/.zshrc"

alias de="RAILS_ENV=development"
alias te="RAILS_ENV=test"
alias pe="RAILS_ENV=production"

alias deploy="git push && b/cap deploy"
alias glo="git log --oneline"
alias gdc="clear; git diff --cached"
alias c="cheat"

alias pw='powder'

# alias git=hub

# Set editors
# export EDITOR="emacs -q -nw"
EDITOR="vim"
export GEMEDITOR="mate"

alias webrick='ruby -e "require '\''webrick'\'';include WEBrick; server = HTTPServer.new( {:DocumentRoot => '\''./'\'', :Port => 5001} ); ['\''INT'\'', '\''TERM'\''].each do |signal|; trap(signal) { server.shutdown }; end; server.start"'

alias rails_tags='ctags -a -e -f TAGS --tag-relative -R app lib vendor'
alias maintain_rails_tags='while [ true ]; do rails_tags; sleep 120; done'

alias accept='bundle exec rspec --drb spec/acceptance/*_spec.rb'

alias sp='run_accept.sh'
alias mig='z rake db:migrate && z rake db:test:clone'
alias dep='git push && b/cap deploy'
alias be='bundle exec'
alias rs='rails server thin'

export ANDROID_SDK_HOME=/usr/local/Cellar/android-sdk/r11
export LANG="en_US.UTF-8"
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
# export LC_ALL=da_DK.UTF-8

function uservm {
    [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.
    export PS1="<RVM> [ \$(~/.rvm/bin/rvm-prompt) - \$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/') - \w ] $ "
}

function dns {
  dig $1 @$2 a +short
}

function userbenv {
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
    alias re='rbenv'
    export PS1="<rbenv> [ \$(rbenv version-name) - \$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/') - \w ] $ "
}

function switch_gomore_branch {
    echo "Checking out branch $1"
    git co $1 || return

    echo "Stopping zeus"
    kill `pgrep zeus`

    echo "Recreating DBs"
    b/rake db:drop db:create db:schema:load db:test:clone

    echo "Creating demo data"
    b/rake db:demo_data

    echo "Done."
}

function recreate_gomore_db {
    echo "Recreating DBs and loading schema"
    b/rake db:drop db:create db:schema:load 

    
    echo "Cloning test db"
    b/rake db:test:clone 
    
    echo "Creating test data"
    b/rake db:demo_data

    echo "Done."
}

# Not used yet - found here: http://unix.stackexchange.com/questions/13464/is-there-a-way-to-find-a-file-in-an-inverse-recursive-search
upsearch () {
  slashes=${PWD//[^\/]/}
  directory=$PWD
  for (( n=${#slashes}; n>0; --n ))
  do
    test -e $directory/$1 && echo $directory/$1 && return
    directory=$directory/..
  done
}

alias re=userbenv
alias rv=uservm

export LSCOLORS=gxfxcxdxbxegedabagacad
alias dstore-clean='find . -type f -name .DS_Store -print0 | xargs -0 rm'
alias rtags="ctags -e -R app lib vendor tasks"

alias emacs='TERM=xterm-256color /Applications/Emacs.app/Contents/MacOS/Emacs -nw'

alias gp='git pull'
alias gd='clear; git diff'
alias gs='git status -sb'

alias ss='b/rspec spec'
alias ssff='z test --fail-fast spec'

alias px='ps aux | grep '
alias restart='touch tmp/restart.txt'
alias r=rails
alias z=zeus

# alias ci='git commit -m'

function ci() {
  if [ -n "$1" ]; then 
    git commit -m "$*"
  else
    git commit
  fi
}

alias aa='git add --all'
alias st='git st'

alias remigrate='z rake db:rollback && z rake db:migrate && z rake db:test:clone'

PROMPT='%{$fg_bold[red]%}➜ %{$fg_bold[green]%}%p %{$fg[cyan]%}%d %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'
unsetopt correct_all
export HAXE_LIBRARY_PATH="$(brew --prefix)/share/haxe/std"

CDPATH=.:/Users/jtj/wb:/Users/jtj/projects

function gg() {
    git commit -v -a -m "$*"
}

function bgem() {
    path=`bundle show $1`
    cd $path
    vim .
}

# Faster Rails startup - from https://gist.github.com/1688857?utm_source=rubyweekly&utm_medium=email
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000


# export S3_KEY='0RXXR2PMPGNEYMM8EW02'
# export S3_SECRET='r0k4RQkv9SpY+8H0V+wJYFWMpNDh9i6r5DyzCpgX'
# export S3_REGION='us-east-1'  
# export S3_BUCKET='dk.workingbits.dts'


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH=/usr/local/share/npm/bin:$PATH

function remove_obsolete_branches {
  current_branch=$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
  if [ "$current_branch" != "master" ]; then
    echo "WARNING: You are on branch $current_branch, NOT master."
  fi
  echo "Fetching merged branches..."
  git remote prune origin
  remote_branches=$(git branch -r --merged | grep -v '/master$' | grep -v '/production$'| grep -v "/$current_branch$")
  local_branches=$(git branch --merged | grep -v 'master$' | grep -v 'production$' | grep -v "$current_branch$")
  if [ -z "$remote_branches" ] && [ -z "$local_branches" ]; then
    echo "No existing branches have been merged into $current_branch."
  else
    echo "This will remove the following branches:"
    if [ -n "$remote_branches" ]; then
      echo "$remote_branches"
    fi
    if [ -n "$local_branches" ]; then
      echo "$local_branches"
    fi
    echo -n "Continue? (y/n): "
    read -q choice
    echo
    if [ "$choice" = "y" ]; then
      # Remove remote branches
      git push origin `git branch -r --merged | grep -v '/master$' | grep -v '/production$' | grep -v "/$current_branch$" | sed 's/origin\//:/g' | tr -d '\n'`
      # Remove local branches
      git branch -d `git branch --merged | grep -v 'master$' | grep -v 'production$' |grep -v "$current_branch$" | sed 's/origin\///g' | tr -d '\n'`
    else
      echo "No branches removed."
    fi
  fi
}

function editconflicts() { 
  vim +/"<<<<<<<" $( git diff --name-only --diff-filter=U | xargs )
}
