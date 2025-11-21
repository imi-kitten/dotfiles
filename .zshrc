# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"

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
# DISABLE_LS_COLORS="true"

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
  1password
  git
  # aliases
  ansible
  brew
)

source $ZSH/oh-my-zsh.sh
#
# ---------------------------------------------------------------------------
#
# Description:  This is all of my bash aliases and whatnot.
#
# ---------------------------------------------------------------------------
# Homebrew
# ---------------------------------------------------------------------------
alias brewup='brew update; brew upgrade; brew cleanup; brew doctor'
# ---------------------------------------------------------------------------
# Useful terminal aliases
# ---------------------------------------------------------------------------
alias cls="clear"                               # Shorter clear
alias cd..="cd .."                              # I don't like spaces..
alias ..="cd .."                                # Even faster if I want it
alias ~="cd ~"                                  # Go home and whatnot
alias ls='ls -GFh'
alias ll='eza -aghHl --git --color auto --icons'
alias src='source ~/.zshrc'
alias pip='pip3'
alias dog='doggo'
alias 7zz='7z'
mkcdir ()
{
    mkdir -p -- "$1" &&
      cd -P -- "$1"
}
alias rename-manga="rename 's/(v)(\d+)/$2/' *"
#---------------------------------------------------------------------------
# Make vim default editor
#---------------------------------------------------------------------------
export EDITOR=nvim
# ---------------------------------------------------------------------------
# Git Aliases!
# ---------------------------------------------------------------------------
alias ga='git add . && git add -u'
alias gs='git status'
alias gc='git commit -m'
alias gp='git push'
alias gpu='git pull'
alias gpo='git push origin '
alias gti='git '
alias got='git '
alias get='git '
alias gpob='git push --set-upstream origin "$(git rev-parse --abbrev-ref HEAD)"'
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"
alias gpm='git profile-manager'
# ---------------------------------------------------------------------------
# macOS things
# ---------------------------------------------------------------------------
alias st='speedtest-cli'
alias sshilo='ssh -oKexAlgorithms=+diffie-hellman-group14-sha1 -oHostKeyAlgorithms=+ssh-dss 192.168.1.101'
export BASH_SILENCE_DEPRECATION_WARNING=1

# ---------------------------------------------------------------------------
# config dir things
# ---------------------------------------------------------------------------

alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

# ---------------------------------------------------------------------------
# nvim conversion
# ---------------------------------------------------------------------------
alias vim='nvim'
alias oldvim='vim'
alias vimconfig='nvim ~/.config/nvim/init.lua'
# ---------------------------------------------------------------------------
# work thingies
# ---------------------------------------------------------------------------
# terraform to tofu
alias terraform='tofu'
alias tf='tofu'
# ---------------------------------------------------------------------------
# other
# ---------------------------------------------------------------------------
eval "$(/opt/homebrew/bin/brew shellenv)"
# onedark="$(vivid generate one-dark)"
# export LS_COLORS=$onedark
# export EXA_COLORS="da=1;34"
export EZA_CONFIG_DIR=$HOME/.config/eza/

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# add mason bin
export PATH="$PATH:$HOME/.local/share/nvim/mason/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
eval "$(oh-my-posh init zsh --config $HOME/themes/imi.omp.yaml)"
setopt TRANSIENT_RPROMPT
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH


# User configuration

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
# Setting Python Requests Extra CA Path
export REQUESTS_CA_BUNDLE="/Library/Application Support/Netskope/STAgent/download/nscacert_combined.pem"
# Setting CURL Extra CA Path
export CURL_CA_BUNDLE="/Library/Application Support/Netskope/STAgent/download/nscacert_combined.pem"
# Setting gRPC Extra CA Path
export GRPC_DEFAULT_SSL_ROOTS_FILE_PATH="/Library/Application Support/Netskope/STAgent/download/nscacert_combined.pem"
# Setting OpenSSL Extra CA Path
export SSL_CERT_FILE="/Library/Application Support/Netskope/STAgent/download/nscacert_combined.pem"
# Setting NodeJS Extra CA Path
export NODE_EXTRA_CA_CERTS="/Library/Application Support/Netskope/STAgent/download/nscacert_combined.pem"
# Setting Git SSL CA Info
export GIT_SSL_CAINFO="/Library/Application Support/Netskope/STAgent/download/nscacert_combined.pem"
# Setting AWS CA Bundle
export AWS_CA_BUNDLE="/Library/Application Support/Netskope/STAgent/download/nscacert_combined.pem"
# Setting Cargo CA Info
export CARGO_HTTP_CAINFO="/Library/Application Support/Netskope/STAgent/download/nscacert_combined.pem"
# Setting Conan C/C++ package manager CA Cert Path
export CONAN_CACERT_PATH="/Library/Application Support/Netskope/STAgent/download/nscacert_combined.pem"
# Setting Haskell Stack Certificate Path
export SYSTEM_CERTIFICATE_PATH="/Library/Application Support/Netskope/STAgent/download/nscacert_combined.pem"
# Setting Elixir Hex CA Certs Path
export HEX_CACERTS_PATH="/Library/Application Support/Netskope/STAgent/download/nscacert_combined.pem"
# Setting Grype Anchore vulnerability scanner CA Cert
export GRYPE_DB_CA_CERT="/Library/Application Support/Netskope/STAgent/download/nscacert_combined.pem"
. "$HOME/.cargo/env"
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:'/Users/ikatzchen/Library/Python/3.9/bin'
export PATH=$PATH:$HOME/.local/bin
eval "$(mise activate zsh)"
