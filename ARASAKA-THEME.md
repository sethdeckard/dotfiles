# Arasaka HUD Theme

Terminal environment themed after the Arasaka Corporation from Cyberpunk 2077 -- a dark military-corporate HUD with abbreviated data labels (`SYS`, `BR:`, `T:`, `ALERT`), box-drawing borders, and a tight neon-on-dark color palette.

## Palette

| Name   | Hex       | RGB             | Role                                       |
|--------|-----------|-----------------|---------------------------------------------|
| bg     | `#0a0f14` | 10, 15, 20      | Primary background                          |
| bg_alt | `#131923` | 19, 25, 35      | Secondary bg (cursorline, popups, inactive)  |
| muted  | `#55606b` | 85, 96, 107     | Comments, borders, labels, separators        |
| fg     | `#93a1ad` | 147, 161, 173   | Default foreground text                      |
| yellow | `#f7f779` | 247, 247, 121   | Primary accent -- constants, strings, search |
| cyan   | `#35f2ff` | 53, 242, 255    | Functions, types, links, info                |
| red    | `#ff4d6d` | 255, 77, 109    | Statements, keywords, errors, deletions      |
| orange | `#ff9f1c` | 255, 159, 28    | Numbers, warnings, specials                  |
| blue   | `#4da6ff` | 77, 166, 255    | Directories, commands                        |

Additional one-off: Visual selection bg `#1c2433`.

## Font

**Files:** `install-fonts`, `.vimrc`, `nvim/lua/config/options.lua`

IosevkaTerm Nerd Font at 14pt. Narrow, technical monospace that fits the corporate-terminal aesthetic. Nerd Font glyphs support eza icons and devicons.

## Surfaces

### iTerm2 Color Scheme

**File:** `Arasaka-HUD.itermcolors`

Full 16-color ANSI mapping plus background, foreground, cursor, selection, link, and badge colors. All mapped to the Arasaka palette. Imported into iTerm2 via Preferences > Profiles > Colors.

### Starship Prompt

**File:** `.config/starship.toml`

- Defines `[palettes.arasaka]` as the single source of truth for palette values
- Two-line HUD layout: `┌─SYS ... ─ZONE ... T:HH:MM` / `└─ BR:branch STATE ...`
- Labels: `SYS`, `ZONE`, `BR:`, `T:`, `SUB`, `ALERT`, `JOBS`, `>>` / `!!`
- OS symbols abbreviated (`MAC`, `LNX`, etc.)
- Directory substitutions: `HOME`, `DEV`, `DOTFILES`, etc.
- Git state module: inline dirty/stash/ahead/behind with `!`, `≡`, `↑`, `↓`, `ADD:`, `DEL:`, `MOD:`, `NEW:`, `CON:`, `REN:`
- Language modules: `RB`, `JS`, `PY`, `RS`, `PKG`

### tmux Status Bar

**File:** `.tmux.conf`

- Status bar at top, bg=bg, fg=fg
- Left: `SYS [session]│WIN` -- session in yellow badge, labels in muted
- Right: `RUNTIME [os] HOST [hostname] T [HH:MM]` -- os in cyan, host in red, time in yellow
- Active window: red badge
- Inactive windows: `:: #I:#W` in muted
- Pane borders: muted default, yellow active
- Message/mode: yellow/red badges on bg

### Boot Sequence MOTD

**File:** `bin/motd`

Shell script sourced from `.zshrc` on interactive shell startup. Prints an Arasaka boot screen with box-drawing borders in muted, header in yellow bold, and system data (OPERATOR, HOST, SESSION, RUNTIME, UPTIME, STATUS) with labels in muted and values in cyan.

Guards: skips in non-interactive shells, VS Code terminal, and tmux panes other than the first pane of the first window.

### Neovim

#### Colorscheme Overrides

**File:** `nvim/lua/plugins/ui.lua`

Base colorscheme `solarized` with full Arasaka highlight overrides:

- **Editor chrome:** Normal, SignColumn, LineNr, CursorLine, CursorLineNr, StatusLine, Visual, Search, IncSearch, Pmenu, PmenuSel, MatchParen, WinSeparator
- **Syntax:** Comment (muted italic), Constant/String/Character (yellow), Number (orange), Boolean (orange bold), Function (cyan bold), Statement/Conditional/Repeat/Keyword (red bold), Operator (red), Type (cyan bold), Special (orange), PreProc (orange bold), Todo (yellow badge)
- **Diagnostics:** Error=red, Warn=orange, Info/Hint=cyan
- **Treesitter:** All `@` groups linked to corresponding vim highlight groups

#### Lualine

**File:** `nvim/lua/plugins/ui.lua`

Custom theme: normal=yellow, insert=cyan, visual/replace=red, command=yellow, inactive=muted. No separators (clean HUD look). Sections: `SYS MODE`, `BR branch`, `filename`, diagnostics, filetype, `LN location`. Tabline shows buffers.

#### Dashboard (alpha-nvim)

**File:** `nvim/lua/plugins/dashboard.lua`

Startup screen with ASCII art header in yellow, HUD-style button labels (`[F] FIND FILE`, `[R] RECENT`, `[G] GREP`, `[C] CONFIG`, `[Q] QUIT`) in cyan with red shortcut keys, and a muted footer tagline. Buttons map to Telescope pickers.

#### gitsigns.nvim

**File:** `nvim/lua/plugins/git.lua`

Sign column highlights: Add=cyan, Change=yellow, Delete=red. Sign characters: `+`, `~`, `_`, `-`. Consistent with delta line number colors.

#### Telescope.nvim

**File:** `nvim/lua/plugins/telescope.lua`

Fuzzy finder UI with Arasaka highlights: borders in muted, prompt title badge in yellow, results title in cyan, preview title in red. Selected row: yellow on bg_alt. Match highlights in cyan bold. Selection caret in red. All normal backgrounds set to bg.

#### nvim-cmp Completion Menu

**File:** `nvim/lua/plugins/completion.lua`

Completion popup item kind highlights follow the syntax color mapping: functions/methods=cyan, classes/structs/interfaces=cyan bold, keywords=red, constants=yellow, snippets/values=orange, variables/fields/properties=fg, text=muted. Match highlights in cyan bold.

#### which-key.nvim

**File:** `nvim/lua/plugins/editor.lua`

Keybind popup: keys in cyan bold, groups in orange, descriptions in fg, separators in muted, borders in muted, float background=bg, values in yellow.

#### Mason.nvim

**File:** `nvim/lua/plugins/lsp.lua`

LSP installer TUI: header in yellow badge, secondary header in cyan badge, highlights in cyan, muted text in muted, muted blocks in fg on bg_alt, errors in red, warnings in orange.

### Vim

#### Colorscheme Overrides

**File:** `.vimrc`

Same Arasaka highlight groups as Neovim using `:hi` commands. Both `guifg`/`guibg` (truecolor) and `ctermfg`/`ctermbg` (256-color fallback). Covers editor chrome and syntax groups.

#### Airline Theme

**File:** `vim/autoload/airline/themes/arasaka.vim`

Custom airline theme: Normal=yellow, Insert=cyan, Visual/Replace=red, Inactive=muted. Warning sections in orange, error sections in red. Symlinked to `~/.vim/autoload/airline/themes/arasaka.vim` via `install`.

### Tig

**File:** `.tigrc` (color section)

Git TUI with Arasaka 256-color approximations: cursor=bg on yellow bold, title bar=yellow on bg_alt, commit IDs=red, dates=muted, added lines=cyan, removed lines=red, hunk headers=muted, refs/tags=orange, remotes=blue, HEAD=yellow bold, staged=cyan, unstaged=orange, untracked=yellow, search results=bg on yellow. Graph palette cycles through yellow/cyan/red/orange/blue.

### Git

#### Delta Diff Viewer

**File:** `.gitconfig` `[delta]` section

- File names in yellow bold, underlined in muted
- Hunk headers in fg italic with muted box border
- Added lines: syntax highlighting on dark green bg (`#0d2818`), emphasis on deeper green (`#1a4d2e`)
- Removed lines: syntax highlighting on dark red bg (`#2c1018`), emphasis on deeper red (`#4d1a2a`)
- Line number gutter: added=cyan, removed=red, unchanged=muted
- Commit headers: yellow bold with box + underline
- Syntax theme: Solarized (dark) for code coloring

#### HUD Log Alias

**File:** `.gitconfig` `[alias]` section

`git lga` -- graph log with Arasaka colors and HUD data-readout style:
```
* hash // subject // author (age) decorations
```
Hash in red, `//` separators in muted, author in cyan, age in yellow, decorations in orange.

### Shell

#### zsh-syntax-highlighting

**File:** `zsh_custom/zsh-syntax-theme.zsh`

Overrides `ZSH_HIGHLIGHT_STYLES` for the zsh-syntax-highlighting plugin:
- Commands/arg0: blue bold
- Builtins/aliases: cyan (bold for builtins)
- Unknown tokens: red bold
- Reserved words/globbing: orange bold/normal
- Strings (single/double/dollar-quoted): yellow
- Paths: fg underlined
- Comments: muted
- Default: fg

#### FZF Fuzzy Finder

**File:** `.zshenv` (`FZF_DEFAULT_OPTS`), `.zshrc` (init)

Fuzzy finder with Arasaka color scheme: bg=bg, selected bg=bg_alt, fg=fg, selected fg=yellow, highlights=cyan, pointer=red, marker=orange, prompt/info=yellow, header/border=muted. Provides Ctrl+R (history), Ctrl+T (file find), Alt+C (cd).

#### eza Directory Listings

**File:** `.zshenv` (`EZA_COLORS`, using `38;2;R;G;B` truecolor sequences)

Color mapping: directories=blue, files=fg, executables=yellow, symlinks=cyan, broken links=red, dates/header/UI chrome=muted or yellow, sizes=cyan, permissions read=yellow/write=red/exec=cyan, owner=yellow, non-owner=orange, Git states=new cyan/modified yellow/deleted red/renamed orange, and file classes pinned to the Arasaka palette (source/music cyan, docs/build yellow, archives/crypto red, compiled artifacts orange).

### bat Syntax Highlighter

**Files:** `.config/bat/themes/arasaka.tmTheme`, `.config/bat/config`

TextMate theme with Arasaka palette: comments=muted italic, strings=yellow, keywords=red bold, functions=cyan bold, numbers=orange, types=cyan bold, operators=red, variables=fg, built-in variables=orange, preprocessor=orange bold, tags=red bold, punctuation=muted, string escapes=orange bold, headings=yellow bold, diff inserted=cyan, diff deleted=red.

Config sets `--theme=arasaka` and `--style=plain,numbers`.

After adding or modifying the theme, run `bat cache --build` to register it.

### Claude Code Status Line

**File:** `claude-statusline-command.sh`

HUD-style status line using 24-bit Arasaka colors and Starship-matching labels:

```
SYS user@host // ZONE ~/path // BR branch // MDL model // CTX 82% // 5h:91% 7d:85%
```

- `SYS` label and `//` separators in muted
- user@host in cyan, cwd in blue, branch in red, model in orange
- Context/rate remaining: color-coded by level (cyan >= 60%, yellow >= 35%, orange >= 15%, red < 15%)

### Xcode

**File:** `Arasaka-HUD.xccolortheme`

Xcode editor theme with full Arasaka palette: bg/bg_alt backgrounds, fg foreground, yellow cursor, visual selection. Syntax: keywords=red, strings/characters=yellow, numbers=orange, functions=cyan, types/classes=cyan, constants=yellow, variables=fg, comments=muted, preprocessor/macros=orange, URLs=blue, regex=orange. Font: IosevkaTermNFM at 15pt. Installed to `~/Library/Developer/Xcode/UserData/FontAndColorThemes/` via `install`.

## Files Map

| File | Surface |
|------|---------|
| `Arasaka-HUD.itermcolors` | iTerm2 |
| `.config/starship.toml` | Starship prompt |
| `.tmux.conf` | tmux status bar + borders |
| `bin/motd` | Terminal boot sequence |
| `nvim/lua/plugins/ui.lua` | Neovim colorscheme + lualine |
| `nvim/lua/plugins/dashboard.lua` | Neovim dashboard |
| `nvim/lua/plugins/git.lua` | Neovim gitsigns |
| `.vimrc` | Vim colorscheme |
| `vim/autoload/airline/themes/arasaka.vim` | Vim airline |
| `.gitconfig` | Delta diff + git log alias |
| `zsh_custom/zsh-syntax-theme.zsh` | zsh-syntax-highlighting |
| `.zshenv` | eza colors, FZF colors, bat config |
| `.config/bat/themes/arasaka.tmTheme` | bat syntax theme |
| `.config/bat/config` | bat settings |
| `claude-statusline-command.sh` | Claude Code status line |
| `.tigrc` | Tig git TUI |
| `nvim/lua/plugins/telescope.lua` | Neovim Telescope |
| `nvim/lua/plugins/completion.lua` | Neovim nvim-cmp |
| `nvim/lua/plugins/editor.lua` | Neovim which-key |
| `nvim/lua/plugins/lsp.lua` | Neovim Mason |
| `Arasaka-HUD.xccolortheme` | Xcode editor theme |
| `install-fonts` | IosevkaTerm Nerd Font |
