if [ "$TERM" = xterm ]; then TERM=xterm-256color; fi

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# fix tilda and ± mixup in ubuntu vm and mac host
# doesnt work in init for some reason, just save this 
# snippet here for later need
# setxkbmap -option apple:badmaps

ZSH_THEME="typewritten" # https://github.com/reobin/typewritten

# display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

  export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"

  export GOPATH="$HOME/code/go"
  export GOBIN="$HOME/bin"
  export PATH=$PATH:/usr/local/go/bin
  export PATH=$PATH:$GOPATH/bin
  export PATH=$PATH:"$HOME/Library/Android/sdk/platform-tools"
  export PATH=$PATH:"/usr/local/opt/binutils/bin"
  export PATH=$PATH:"$HOME/.local/bin/"
# export MANPATH="/usr/local/man:$MANPATH"
  export PATH=$PATH:$HOME/bin

  source $ZSH/oh-my-zsh.sh

  export EDITOR='vim'

  if [ -z "$TMUX" ]
  then
    tmux -u attach -t TMUX || tmux -u new -s TMUX
  fi

# You may need to manually set your language environment
# export LANG=en_US.UTF-8
#

export LANG=en_US.UTF-8
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

export ANDROID_HOME=/Users/$USER/Library/Android/sdk

export PATH=$PATH:$HOME/bin/
export PATH=$PATH:$HOME/Library/Python/2.7/bin
export PATH=$PATH:$HOME/Library/Python/3.7/bin
export PATH=$PATH:$HOME/.gem/ruby/2.6.0/bin
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/build-tools/29.0.2
export PATH=${PATH}:$HOME/.cargo/bin

alias ldd="otool -L"
alias gadb="/Applications/Genymotion.app/Contents/MacOS/player.app/Contents/MacOS/tools/adb"
alias tldr="$(which tldr) -s" # https://github.com/isacikgoz/tldr

export EDITOR='vim'


[ -f $HOME/.cargo/env ] && source $HOME/.cargo/env

# added by travis gem
[ -f /Users/gal/.travis/travis.sh ] && source /Users/gal/.travis/travis.sh
