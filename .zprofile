# homebrew
if [[ "$OSTYPE" == darwin* ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# pyenv
if which pyenv > /dev/null; then eval "$(pyenv init --path)"; fi

# swiftenv
if which swiftenv > /dev/null; then eval "$(swiftenv init -)"; fi
