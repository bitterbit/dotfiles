if [ "$TERM" = xterm ]; then TERM=xterm-256color; fi

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# fix tilda and ± mixup in ubuntu vm and mac host
# doesnt work in init for some reason, just save this 
# snippet here for later need
# setxkbmap -option apple:badmaps

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

# ZSH_THEME="nicoulaj"
ZSH_THEME="typewritten" # https://github.com/reobin/typewritten

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

  export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"

  export GOPATH="$HOME/dev/go"
  export GOBIN="$HOME/bin"
  export PATH=$PATH:/usr/local/go/bin
  export PATH=$PATH:$GOPATH/bin
  export PATH=$PATH:"$HOME/Library/Android/sdk/platform-tools"
  export PATH=$PATH:"/usr/local/opt/binutils/bin"
  export PATH=$PATH:"$HOME/.local/bin/"
# export MANPATH="/usr/local/man:$MANPATH"

  source $ZSH/oh-my-zsh.sh

  export EDITOR='vim'

  if [ -z "$TMUX" ]
  then
    tmux attach -t TMUX || tmux new -s TMUX
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

alias ldd="otool -L"
alias gadb="/Applications/Genymotion.app/Contents/MacOS/player.app/Contents/MacOS/tools/adb"

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
