fpath+=("$(brew --prefix)/share/zsh/site-functions")

# General
autoload -Uz compinit; compinit
autoload -Uz colors; colors
autoload history-search-end

# Smart Url
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

# Edit command line with EDITOR
autoload -Uz edit-command-line
zle -N edit-command-line

WORDCHARS="*?_-.[]~=&;!#$%^(){}<>"

export HISTFILE="$XDG_DATA_HOME"/zsh/history
export HISTSIZE=20000
export SAVEHIST=20000

# Emacs keybindings
bindkey -e

local srcdir="$XDG_CONFIG_HOME/zsh"

# Shell options
source "$srcdir/shelloptions.zsh"

export PURE_PROMPT_SYMBOL="❫"
zstyle :prompt:pure:path color white
zstyle :prompt:pure:git:branch color green
zstyle :prompt:pure:git:branch:cached color green
zstyle :prompt:pure:git:dirty color white
zstyle :prompt:pure:git:arrow color white
zstyle :prompt:pure:git:stash color white
zstyle :prompt:pure:prompt:error color red
zstyle :prompt:pure:git:stash show yes
autoload -U promptinit; promptinit
prompt pure

export FZF_DEFAULT_OPTS="--color=16 --color='fg:white,fg+:white:bold,bg+:bright-black,hl:magenta:bold,marker:white:bold,prompt:blue,info:yellow' --bind=down:half-page-down,up:half-page-up"
export FZF_DEFAULT_COMMAND="fd --type f \
  --hidden \
  --exclude .git \
  --exclude .DS_Store \
  --exclude .localized"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_PREVIEW_COMMAND="cat {}"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

[[ $- == *i* ]] && source "$(brew --prefix)/fzf/shell/completion.zsh" 2> /dev/null
source "/$(brew --prefix)/opt/fzf/shell/key-bindings.zsh"

# Completions
source "$srcdir/completions.zsh"

# Functions
for fn ($srcdir/functions/*.zsh) source $fn

# Aliases
source "$srcdir/aliases.zsh"

eval "$(zoxide init zsh --cmd j)"

source "$(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh"

# Ensure unique path
typeset -gU cdpath fpath mailpath path