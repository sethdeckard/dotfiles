# .dotfiles

Personal development environment configuration (Neovim, zsh, tmux, etc.) with an install script that symlinks configs into `$HOME`. Themed with the [Arasaka HUD](ARASAKA-THEME.md) color palette inspired by Cyberpunk 2077. Works on both macOS and Linux.

## Setup

1. Clone to `~/.dotfiles`.
2. Run `./install` to create symlinks and install CLI tools.
3. Install a Nerd Font: `./install-fonts`.
4. Import `Arasaka-HUD.itermcolors` in iTerm2 under Settings > Profiles > Colors > Color Presets.

The install script is idempotent and safe to re-run.

### macOS

Install [Homebrew](https://brew.sh):

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

The install script uses Homebrew to install: bat, delta, eza, fzf, neovim, starship, tmux, zoxide.

## Structure

- Config files prefixed with `.` live at the repo root and are symlinked to `$HOME`.
- `nvim/` is symlinked as a directory to `~/.config/nvim`.
- `zsh_custom/` contains Oh My Zsh custom plugins and themes (managed as git submodules).
- `bin/` contains utility scripts symlinked into `~/bin`.
- `vim/` contains Vim-specific config (airline theme) symlinked into `~/.vim/`.
- `.config/` contains configs for starship, bat, and other XDG tools.
- `claude_settings.json` is symlinked to `~/.claude/settings.json`.

## Editors

### Neovim (primary)

Lua-based config in `nvim/lua/`. Plugin manager: [lazy.nvim](https://github.com/folke/lazy.nvim).

- **LSP**: Mason + nvim-lspconfig (clangd, gopls, pyright, solargraph, ts_ls, sourcekit, and more)
- **Completion**: nvim-cmp + LuaSnip
- **Fuzzy find**: Telescope with fzf-native
- **Git**: fugitive + gitsigns.nvim
- **UI**: lualine, alpha-nvim dashboard, Arasaka theme overrides
- **Treesitter**: syntax highlighting and text objects

### Vim / MacVim (secondary)

Plugin manager: [vim-plug](https://github.com/junegunn/vim-plug). Lightweight setup with fugitive, gitgutter, airline (Arasaka theme), solarized8 + Arasaka highlight overrides, and vim-rails.

Font: IosevkaTerm Nerd Font (`install-fonts`).

## Shell

- [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh) for plugin management.
- [Starship](https://starship.rs) prompt with custom Arasaka HUD layout.
- Custom plugins as git submodules: zsh-autosuggestions, zsh-completions, zsh-syntax-highlighting.
- Modern CLI replacements: bat (cat), delta (diff), eza (ls), fzf (fuzzy find), zoxide (cd).

## tmux

- [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm)
- Arasaka-themed status bar at top with HUD-style labels.

## iTerm2

- Import `Arasaka-HUD.itermcolors` for the terminal color scheme.
- Font: IosevkaTerm Nerd Font, 15pt, ligatures off.

## Window Management

- [AeroSpace](https://github.com/nicklockwood/AeroSpace) tiling window manager (`.aerospace.toml`).

## Theme

The Arasaka HUD theme is documented in [ARASAKA-THEME.md](ARASAKA-THEME.md). It covers: iTerm2, Starship, tmux, Neovim, Vim, tig, bat, delta, eza, FZF, zsh-syntax-highlighting, Claude Code status line, and Xcode.

## rbenv

Supported if installed. Default gems are listed in `default-gems` and auto-installed for each new Ruby version via [rbenv-default-gems](https://github.com/rbenv/rbenv-default-gems).

## Homebrew

- Zsh completions enabled if brew is installed.
- `HOMEBREW_GITHUB_API_TOKEN` read from `~/.config/homebrew/.api_token`.

## License

Public Domain
