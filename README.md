# .dotfiles

Various configuration files for my development environment (vim, zsh, tmux, etc.). Includes an install script to create symbolic links in `$HOME`. Works on both macOS and Linux.

## Setup

1. Clone to a directory of your choice (ex: `~/.dotfiles`.).
2. Update Git submodules: `git submodule update --init --recursive`.
3. Install optionals (Homebrew, rbenv, etc. - see sections below).
4. Run `./install` to create or recreate the symlinks.

### macOS

Install [Homebrew](https://brew.sh) (optional):

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

#### Homebrew support

- Modifies `PATH`
- Assigns `HOMEBREW_GITHUB_API_TOKEN` from a text file in `~/.config/homebrew/.api_token` (need better secret management).
- Installs required fonts. (script: `install-fonts`)

### rbenv

[rbenv](https://github.com/rbenv/rbenv) is supported, if installed.

#### Default Gems

```
git clone https://github.com/rbenv/rbenv-default-gems.git $(rbenv root)/plugins/rbenv-default-gems
```

### zsh

- [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh) for plugin/configuration management.
- A font from [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts) installed and configured in your terminal emulator as the non-ASCII font. (script: `install-fonts`)

## tmux

- [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm)
- [Powerline](https://github.com/powerline/powerline) (requires a proper Python, not system)

## Vim

- Plugin manager: [vim-plug](https://github.com/junegunn/vim-plug).
- GUI Vim requires the font `Hack Nerd Font`. (script: `install-fonts`)

## Assumptions

- Assumes `~/projects/` for root project directory (used in `GO_PATH`, etc.), not configurable but could be made to be so.

## TODO

- Scripts for bootstrapping ruby/rbenv/default-gems, python/pyenv/packages.
- Dynamically generate section of tmux.conf that references powerline path based on above (can't seem to use ENV in tmux.conf).

## License

Public Domain
