export XDG_CONFIG_HOME="$HOME/.config"
# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Hook direnv
export DIRENV_LOG_FORMAT=""
eval "$(direnv hook zsh)"

# Init homebrew
eval $(/opt/homebrew/bin/brew shellenv)

# Init oh-my-posh
eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/tokyonight_storm.qmi.toml)"

# Add zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit light MichaelAquilina/zsh-you-should-use

# Add snippets
zinit snippet OMZP::git
zinit snippet OMZP::tmux
zinit snippet OMZP::command-not-found

export PATH="$PATH:/Users/qmi/.local/bin"

eval $(thefuck --alias)
zinit snippet OMZP::thefuck

autoload -U compinit && compinit


zinit cdreplay -q

# Keybindings
bindkey -e # Emacs
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias zshconfig="nvim ~/.zshrc"

alias ls='ls --color'
alias lsa='ls -lAh'

alias oke="echo oke"
alias cool="echo cool"

alias htop="btop"
alias cat='bat -p -P'

alias antlr4py3='java org.antlr.v4.Tool -Dlanguage=Python3 -o target'
alias installdir='dirname "$(pwd)"'
alias pygrun='python3 "$(installdir)"/bin/pygrun'
alias antlr4='java -jar /usr/local/lib/antlr-4.9.2-complete.jar -o target'
alias grun='java org.antlr.v4.runtime.misc.TestRig'

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"


# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"
################################################################################ 
# ZSH PLUGINS VARIABLES
# tmux
export ZSH_TMUX_AUTOSTART=false
export ZSH_TMUX_AUTOSTART_ONCE=true
export ZSH_TMUX_AUTOCONNECT=true
export ZSH_TMUX_AUTOQUIT=ZSH_TMUX_AUTOSTART
# ZSH_TMUX_CONFIG	Set the configuration path (default: $HOME/.tmux.conf, $XDG_CONFIG_HOME/tmux/tmux.conf)
# ZSH_TMUX_DEFAULT_SESSION_NAME	Set tmux default session name when autostart is enabled
export ZSH_TMUX_AUTONAME_SESSION=true
export ZSH_TMUX_DETACHED=false
# ZSH_TMUX_FIXTERM	Sets $TERM to 256-color term or not based on current terminal support
# ZSH_TMUX_FIXTERM_WITHOUT_256COLOR	$TERM to use for non 256-color terminals (default: tmux if available, screen otherwise)
# ZSH_TMUX_FIXTERM_WITH_256COLOR	$TERM to use for 256-color terminals (default: tmux-256color if available, screen-256color otherwise)
# ZSH_TMUX_ITERM2	Sets the -CC option for iTerm2 tmux integration (default: false)
# ZSH_TMUX_UNICODE	Set tmux -u option to support unicode
################################################################################ 

################################################################################ 
# Software initialize from here

# Ollama
export OLLAMA_HOST=localhost:11435

# postgresql homebrew
# export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"
# export LDFLAGS="-L/opt/homebrew/opt/postgresql@16/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/postgresql@16/include"
# export PKG_CONFIG_PATH="/opt/homebrew/opt/postgresql@16/lib/pkgconfig"

# ANTLR
export ANTLR_JAR=/usr/local/lib/antlr-4.9.2-complete.jar
export CLASSPATH=".:/usr/local/lib/antlr-4.9.2-complete.jar:$CLASSPATH"

## openjdk
# export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# Haskell
[ -f "/Users/qmi/.ghcup/env" ] && source "/Users/qmi/.ghcup/env" # ghcup-env

# Julia
export PATH="/Applications/Julia-1.8.app/Contents/Resources/julia/bin:$PATH"

# cargo
export PATH="$HOME/.cargo/bin:$PATH"

# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# <<< JVM installed by coursier <<<
export JAVA_HOME="/Users/qmi/Library/Caches/Coursier/arc/https/github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11%252B28/OpenJDK11-jdk_x64_mac_hotspot_11_28.tar.gz/jdk-11+28/Contents/Home"
# <<< JVM installed by coursier <<<

# Zig
export PATH="$HOME/zig-bootstrap-0.14.0-dev.2064+b5cafe223/out/zig-aarch64-macos-none-baseline:$PATH"

eval "$(pixi completion --shell zsh)"
