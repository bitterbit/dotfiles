# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
if [ "$TERM" = xterm ]; then TERM=xterm-256color; fi

# Path to your oh-my-zsh installation.
# export ZSH=~/.oh-my-zsh

# fix tilda and ± mixup in ubuntu vm and mac host
# doesnt work in init for some reason, just save this 
# snippet here for later need
# setxkbmap -option apple:badmaps

# ZSH_THEME="typewritten" # https://github.com/reobin/typewritten

# display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git)

# User configuration

  export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"

  export GOPATH="$HOME/code/go"
  export GOBIN="$HOME/bin"
  export PATH=$PATH:/opt/homebrew/bin/brew
  export PATH=$PATH:/usr/local/bin
  export PATH=$PATH:/usr/local/go/bin
  export PATH=$PATH:$GOPATH/bin
  export PATH=$PATH:"$HOME/Library/Android/sdk/platform-tools"
  export PATH=$PATH:"/usr/local/opt/binutils/bin"
  export PATH=$PATH:"$HOME/.local/bin/"
# export MANPATH="/usr/local/man:$MANPATH"
  export PATH=$PATH:$HOME/bin
  export PATH=$PATH:/opt/homebrew/bin
  export PATH=$PATH:$HOME/Library/Python/3.8/bin
  export PATH=$PATH:~/.fig/bin

  # add libcrypto (of openssl) to the pkg path so rdkafka can use it
  export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/opt/homebrew/Cellar/openssl@3/3.1.1/lib/pkgconfig

#  source $ZSH/oh-my-zsh.sh

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
export PATH=${PATH}:$HOME/.cargo/bin
export PATH="/usr/local/opt/qt/bin:$PATH"
export PATH="/opt/homebrew/opt/awscli@1/bin:$PATH"

source $HOME/.cargo/env


alias tldr="$(which tldr) -s" # https://github.com/isacikgoz/tldr
alias ls="exa"

export EDITOR='nvim'


[ -f $HOME/.cargo/env ] && source $HOME/.cargo/env

# added by travis gem
[ -f /Users/gal/.travis/travis.sh ] && source /Users/gal/.travis/travis.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/gal/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/gal/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/gal/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/gal/google-cloud-sdk/completion.zsh.inc'; fi

eval "$(starship init zsh)"

if [ "$TERM_PROGRAM" = "WarpTerminal" ]; then
    echo "in warp!"
elif [ -z "$TMUX" ]; then
	tmux -u attach -t TMUX || tmux -u new -s TMUX
fi

# google-cloud-sdk brew caveat
source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

export GITLAB_TOKEN=$(security find-generic-password -a ${USER} -s gitlab_token -w)
# BEGIN ANSIBLE MANAGED BLOCK
# Add homebrew binaries to the path.
export PATH="/opt/homebrew/bin:${PATH?}"

# Force certain more-secure behaviours from homebrew
export HOMEBREW_NO_INSECURE_REDIRECT=1
export HOMEBREW_CASK_OPTS=--require-sha
export HOMEBREW_DIR=/opt/homebrew
export HOMEBREW_BIN=/opt/homebrew/bin

# Load python shims
eval "$(pyenv init -)"

# Load ruby shims
eval "$(rbenv init -)"

# Prefer GNU binaries to Macintosh binaries.
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:${PATH}"

# Add AWS CLI to PATH
export PATH="/opt/homebrew/opt/awscli@1/bin:$PATH"

# Add datadog devtools binaries to the PATH
export PATH="${HOME?}/dd/devtools/bin:${PATH?}"

# Point GOPATH to our go sources
export GOPATH="${HOME?}/go"

# Add binaries that are go install-ed to PATH
export PATH="${GOPATH?}/bin:${PATH?}"

# Point DATADOG_ROOT to ~/dd symlink
export DATADOG_ROOT="${HOME?}/dd"

# Tell the devenv vm to mount $GOPATH/src rather than just dd-go
export MOUNT_ALL_GO_SRC=1

## AWS Info
# store key in the login keychain instead of aws-vault managing a hidden keychain
export AWS_VAULT_KEYCHAIN_NAME=login
# tweak session times so you don't have to re-enter passwords every 5min
export AWS_SESSION_TTL=24h
export AWS_ASSUME_ROLE_TTL=1h

# Helm switch from storing objects in kubernetes configmaps to
# secrets by default, but we still use the old default.
export HELM_DRIVER=configmap

# Go 1.16+ sets GO111MODULE to off by default with the intention to
# remove it in Go 1.18, which breaks projects using the dep tool.
# https://blog.golang.org/go116-module-changes
export GO111MODULE=auto
export GOPRIVATE=github.com/DataDog
# END ANSIBLE MANAGED BLOCK

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
