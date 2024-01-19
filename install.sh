#!/bin/sh

# XDG
if [[ -z "$XDG_CONFIG_HOME" ]]; then
  export XDG_CONFIG_HOME="$HOME/Library/Preferences"
fi

if [[ -z "$XDG_CACHE_HOME" ]]; then
  export XDG_CACHE_HOME="$HOME/Library/Caches"
fi

if [[ -z "$XDG_DATA_HOME" ]]; then
  export XDG_DATA_HOME="$HOME/Library/Application\ Support"
fi

if [[ -z "$XDG_STATE_HOME" ]]; then
  export XDG_STATE_HOME="$HOME/Library/Application\ Support"
fi

if [[ -z "$XDG_DATA_DIRS" ]]; then
  export XDG_DATA_DIRS="/usr/local/share:/usr/share"
fi

if [[ -z "$XDG_CONFIG_DIRS" ]]; then
  export XDG_CONFIG_DIRS="/Library/Preferences"
else
  export XDG_CONFIG_DIRS="/Library/Preferences:$XDG_CONFIG_DIRS"
fi

cd "$HOME" || exit

git clone https://github.com/reitennn/dotfiles .dotfiles

cd .dotfiles || exit

if ! (command -v brew > /dev/null); then
  echo "Installing brew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Install all programs..."
/usr/local/bin/brew bundle install

echo "Stowing config files..."
stow --restow --no-folding git
stow --restow --no-folding zsh

echo "Done. :)"