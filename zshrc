# Author: Atyansh Jaiswal (AJ)

# Enable auto-completion
autoload -Uz compinit
compinit

# Enable themes (Use 'prompt')
autoload -Uz promptinit
promptinit

# Use preferred prompt
prompt suse

# Add traversable menu to auto-completion
zstyle ':completion:*' menu select

# Show description of auto-completions
zstyle ':completion:*:descriptions' format '%U%B%d%b%u' 

# Show warning when nothing to auto-complete
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

# Override prompt until I can find a decent prompt
PS1="%B%n:%3~%#%b "

# Auto-correct
setopt correctall

# Set Editor to be vim
EDITOR=vim

# Set up shell history
HISTFILE=$HOME/.zsh_history
HISTSIZE=1000000
SAVEHIST=$HISTSIZE

# Don't duplicate shell history
setopt hist_ignore_all_dups

# Don't record shell command if preceded by space
setopt hist_ignore_space

# autocd
setopt autocd

alias ls="ls -G"
alias ll="ls -l"
alias lh="ls -lh"
alias la="ls -a"
alias grep="grep --color=auto"
#alias ocaml="rlwrap ocaml"
alias unlock="python ~/.scripts/unlock.py"

source ~/.scripts/aliases.zsh
