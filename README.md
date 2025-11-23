# Public Dotfiles

Personal configuration files for zsh and vim.

## Contents

| File | Description |
|------|-------------|
| `zshrc` | Zsh configuration with antigen, plugins, and cross-platform support |
| `p10k.zsh` | Powerlevel10k prompt configuration |
| `solarized-ls.ini` | Custom fast-syntax-highlighting theme matching LS_COLORS |
| `vimrc` | Vim configuration with Vundle and solarized theme |

## Zsh Setup

### Prerequisites

1. **Install antigen** (plugin manager):
   ```bash
   mkdir -p ~/.scripts
   curl -L git.io/antigen > ~/.scripts/antigen.zsh
   ```

2. **Install Nerd Fonts** (for powerlevel10k icons):

   Download and install [MesloLGS NF](https://github.com/romkatv/powerlevel10k#fonts) on your **local machine** (the one running your terminal, not remote servers).

   Configure your terminal to use "MesloLGS NF" font.

### Installation

```bash
# Clone the repo
git clone https://github.com/Atyansh/public-files.git ~/projects/public-files
cd ~/projects/public-files

# Copy zsh configs
cp zshrc ~/.zshrc
cp p10k.zsh ~/.p10k.zsh

# Create config directory and copy theme
mkdir -p ~/.config/fsh
cp solarized-ls.ini ~/.config/fsh/

# Reload shell (first load will be slow as plugins are downloaded)
exec zsh
```

### What Gets Installed

**Plugins (via antigen):**
- `git` - Git aliases and functions
- `zsh-users/zsh-autosuggestions` - Fish-like history suggestions
- `zsh-users/zsh-completions` - Additional tab completions
- `MichaelAquilina/zsh-you-should-use` - Alias reminders
- `paulirish/git-open` - Open repo in browser with `git open`
- `zdharma-continuum/fast-syntax-highlighting` - Command syntax highlighting
- `Atyansh/zsh-syntax-highlighting-filetypes` - LS_COLORS-based file highlighting

**Theme:**
- `romkatv/powerlevel10k` - Fast, customizable prompt

### Customization

- **Prompt**: Run `p10k configure` to reconfigure the prompt
- **Syntax theme**: Edit `~/.config/fsh/solarized-ls.ini` and run `fast-theme XDG:solarized-ls`
- **Update plugins**: Run `antigen update`

## Vim Setup

### Prerequisites

1. **Install Vundle** (plugin manager):
   ```bash
   git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
   ```

### Installation

```bash
# Copy vimrc
cp vimrc ~/.vimrc

# Install plugins
vim +PluginInstall +qall
```

### Plugins

- `rust-lang/rust.vim` - Rust language support
- `vim-syntastic/syntastic` - Syntax checking
- `altercation/vim-colors-solarized` - Solarized colorscheme
- `Shougo/vimproc.vim` - Async execution
- `eagletmt/ghcmod-vim` - Haskell support

### Features

- Solarized dark theme
- 2-space indentation
- Line numbers
- Mouse support
- Smart search (case-insensitive unless uppercase used)
- Column marker at 80 characters

## Platform Support

The zshrc is configured to work on both **macOS** and **Linux**:

- Platform-specific `ls` aliases (`ls -G` on macOS, `ls --color=auto` on Linux)
- Platform-specific `LS_COLORS`/`LSCOLORS`
- Cross-platform Google Cloud SDK paths

## Quick Reference

| Command | Description |
|---------|-------------|
| `exec zsh` | Reload shell |
| `antigen update` | Update all plugins |
| `p10k configure` | Reconfigure prompt |
| `fast-theme -l` | List syntax themes |
| `fast-theme XDG:solarized-ls` | Apply custom syntax theme |
| `git open` | Open repo in browser |
