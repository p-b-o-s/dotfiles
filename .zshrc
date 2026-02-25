# Fix Display & Locale Issues on Ubuntu
export TERM=xterm-256color
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-autocomplete aliases dircycle web-search docker brew themes)

source $ZSH/oh-my-zsh.sh

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv zsh)"

# fnm
FNM_PATH="/home/ubuntu/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias nv='NVIM_APPNAME=nvchad nvim'
alias hg='history | grep'
alias cc='claude'
alias lg='lazygit'
alias tma='tmux a'


# increase the minimum number of characters you must type
# before completion suggestions appear
zstyle ':autocomplete:*' min-input 3




export PATH=$PATH:$HOME/.local/bin

# bun completions
[ -s "/home/ubuntu/.bun/_bun" ] && source "/home/ubuntu/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# ---- FZF -----

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

# -- Use fd instead of fzf --

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

# ---- Eza (better ls) -----
alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"

export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo $'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "bat -n --color=always --line-range :500 {}" "$@" ;;
  esac
}

# Docker Enter Container as 'node' user
din() {
  if [ -z "$1" ]; then
    echo "❌ Error: Please specify a container name or ID."
    echo "🐳 Running containers:"
    docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Status}}"
    return 1
  fi

  docker exec -u node -it "$1" zsh
}

# Docker Enter LAST container as 'node' user
dlast() {
  local container_id=$(docker ps -q | head -n 1)

  if [ -z "$container_id" ]; then
    echo "❌ No running containers found."
    return 1
  fi

  echo "🚀 Entering container: $container_id (User: node)..."
  docker exec -u node -it "$container_id" zsh
}

# bindkey '^I' autosuggest-accept

gacp() {
  git add . && git commit -m "$1" && git push
}

# ---- Zoxide (better cd) ----
eval "$(zoxide init zsh)"


eval "$(oh-my-posh init zsh)"

export PATH="$PATH:/home/ubuntu/.opencode/bin"

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

path=('/home/ubuntu/.juliaup/bin' $path)
export PATH

# <<< juliaup initialize <<<


# Odin

export PATH=$HOME/languages_from_source/Odin:$PATH
export PATH=$HOME/languages_from_source/ols:$PATH

# Odin
