#!/bin/bash
# Setup script for macOS
# Author: Atyansh Jaiswal (AJ)

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "=== Setting up dotfiles ==="

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

print_status() {
    echo -e "${GREEN}[✓]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[!]${NC} $1"
}

print_skip() {
    echo -e "${BLUE}[→]${NC} Skipped: $1"
}

confirm() {
    read -p "$1 [y/N] " response
    case "$response" in
        [yY][eE][sS]|[yY]) return 0 ;;
        *) return 1 ;;
    esac
}

# Create necessary directories
mkdir -p ~/.scripts
mkdir -p ~/.config/fsh
mkdir -p ~/.vim/bundle

# Install Vundle
if confirm "Install Vundle (vim plugin manager)?"; then
    if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
        echo "Installing Vundle..."
        git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
        print_status "Vundle installed"
    else
        print_status "Vundle already installed"
    fi
else
    print_skip "Vundle"
fi

# Install Antigen
if confirm "Install Antigen (zsh plugin manager)?"; then
    if [ ! -f ~/.scripts/antigen.zsh ]; then
        echo "Installing Antigen..."
        curl -L git.io/antigen > ~/.scripts/antigen.zsh
        print_status "Antigen installed"
    else
        print_status "Antigen already installed"
    fi
else
    print_skip "Antigen"
fi

# Copy zshrc
if confirm "Copy zshrc?"; then
    if [ -f ~/.zshrc ]; then
        cp ~/.zshrc ~/.zshrc.backup
        print_warning "Existing ~/.zshrc backed up to ~/.zshrc.backup"
    fi
    cp "$SCRIPT_DIR/zshrc" ~/.zshrc
    print_status "Copied zshrc"
else
    print_skip "zshrc"
fi

# Copy vimrc
if confirm "Copy vimrc?"; then
    if [ -f ~/.vimrc ]; then
        cp ~/.vimrc ~/.vimrc.backup
        print_warning "Existing ~/.vimrc backed up to ~/.vimrc.backup"
    fi
    cp "$SCRIPT_DIR/vimrc" ~/.vimrc
    print_status "Copied vimrc"
else
    print_skip "vimrc"
fi

# Copy p10k.zsh
if confirm "Copy p10k.zsh (Powerlevel10k config)?"; then
    if [ -f ~/.p10k.zsh ]; then
        cp ~/.p10k.zsh ~/.p10k.zsh.backup
        print_warning "Existing ~/.p10k.zsh backed up to ~/.p10k.zsh.backup"
    fi
    cp "$SCRIPT_DIR/p10k.zsh" ~/.p10k.zsh
    print_status "Copied p10k.zsh"
else
    print_skip "p10k.zsh"
fi

# Copy solarized-ls.ini
if confirm "Copy solarized-ls.ini (syntax highlighting theme)?"; then
    if [ -f ~/.config/fsh/solarized-ls.ini ]; then
        cp ~/.config/fsh/solarized-ls.ini ~/.config/fsh/solarized-ls.ini.backup
        print_warning "Existing solarized-ls.ini backed up to ~/.config/fsh/solarized-ls.ini.backup"
    fi
    cp "$SCRIPT_DIR/solarized-ls.ini" ~/.config/fsh/solarized-ls.ini
    print_status "Copied solarized-ls.ini"
else
    print_skip "solarized-ls.ini"
fi

# Install fonts
if confirm "Install MesloLGS NF fonts?"; then
    for font in "$SCRIPT_DIR/fonts/"*.ttf; do
        font_name=$(basename "$font")
        if [ -f ~/Library/Fonts/"$font_name" ]; then
            print_status "Font '$font_name' already installed"
        else
            cp "$font" ~/Library/Fonts/
            print_status "Installed font '$font_name'"
        fi
    done
else
    print_skip "fonts"
fi

# Install Vim plugins
if confirm "Install Vim plugins via Vundle?"; then
    echo "Installing Vim plugins..."
    vim +PluginInstall +qall
    print_status "Vim plugins installed"
else
    print_skip "Vim plugins"
fi

echo ""
echo "=== Setup complete! ==="
echo ""
print_warning "Manual steps remaining:"
echo "  1. Copy aliases.zsh from private-files repo to ~/.scripts/aliases.zsh"
echo "  2. Import iTerm2 settings: File → Import All Settings → select 'iTerm2 State.itermexport'"
echo "  3. Restart your terminal or run: source ~/.zshrc"
