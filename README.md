# .dotfiles

Various configuration files for my development environment (vim, zsh, tmux, etc.). Includes an install script to create symbolic links in `$HOME`. Works on both macOS and Linux.

1. Clone to a directory of your choice (ex: `~/.dotfiles`.)
2. Pull all git submodules: `git submodule update --init --recursive`
3. Optionally install rbenv and [rbenv-default-gems](https://github.com/rbenv/rbenv-default-gems) to allow for creation of `default-gems` symlink during install.
4. Run `./install` to create or recreate the symlinks.

rbenv-default-gems:
`git clone https://github.com/rbenv/rbenv-default-gems.git $(rbenv root)/plugins/rbenv-default-gems`

### ZSH Requirements

1. [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh) for plugin/configuration management.
2. Homebrew: if on macOS, it will modify `PATH` and assign `HOMEBREW_GITHUB_API_TOKEN` from a text file in `~/.config/homebrew/.api_token`.
3. A font from [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts) installed and configured in your terminal emulator as the non-ASCII font.

```bash
$ brew tap caskroom/fonts
$ brew cask install font-hack
$ brew cask install font-hack-nerd-font
```

### tmux Requirements

1. [Powerline](https://github.com/powerline/powerline) (requires Python)

### Vim Requirements

1. [Vundle](https://github.com/VundleVim/Vundle.vim) for plugin management.
2. GUI Vim requires Knack Regular Nerd Font Complete font.
3. [YouCompleteMe](https://github.com/Valloric/YouCompleteMe) for code completion. (not required when using minimal configuration: .vimrc_min)

### Assumptions

1. Assumes `~/projects/` for root project directory (used in `GO_PATH`, etc.), not configurable but could be made to be so.

#### License

Public Domain
