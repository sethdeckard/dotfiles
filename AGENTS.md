# Dotfiles

Personal development environment configuration (vim, zsh, tmux, neovim, etc.) with an install script that symlinks configs into `$HOME`. Works on both macOS and Linux.

## Key conventions

- Everything must work on both macOS and Linux — avoid platform-specific flags or paths without a cross-platform fallback.
- To change a config, edit the source file in this repo — never edit the symlinked file in `$HOME` directly.
- Run `./install` to (re)create symlinks after adding new config files.
- The install script is idempotent and safe to re-run.

## Structure

- Config files prefixed with `.` live at the repo root and are symlinked to `$HOME`.
- `nvim/` is symlinked as a directory to `~/.config/nvim`.
- `zsh_custom/` contains Oh My Zsh custom plugins and themes (managed as git submodules).
- `bin/` contains utility scripts symlinked into `~/bin`.
- `claude_settings.json` is symlinked to `~/.claude/settings.json`.

## Adding a new config

1. Add the file to the repo.
2. Add a `ln -sf` line in `./install` to symlink it to the right location.
3. Run `./install`.
