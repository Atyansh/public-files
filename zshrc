# Author: Atyansh Jaiswal (AJ)

## A n00b's attempt at customizing zsh

export TERM="xterm-256color"

# Enable auto-completion
autoload -Uz compinit
compinit

# Enable themes (Use 'prompt')
# autoload -Uz promptinit
# promptinit

# Use preferred prompt
# prompt suse

# Add traversable menu to auto-completion
zstyle ':completion:*' menu select

# Show description of auto-completions
zstyle ':completion:*:descriptions' format '%U%B%d%b%u' 

# Show warning when nothing to auto-complete
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

# Override prompt until I can find a decent prompt
# PS1="%F{magenta}%B%n:%3~%#%b%f "

# Auto-correct
# setopt correctall

# Set Editor to be vim
EDITOR=vim

# Set up shell history
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE

# Don't duplicate shell history
setopt hist_ignore_all_dups

# Don't record shell command if preceded by space
setopt hist_ignore_space

# autocd
setopt autocd

# Show PID of suspended jobs (useful for vim)
setopt longlistjobs

# No more fucking beeps
setopt nobeep

# Keep directory stack
setopt auto_pushd

# Ignore duplicates on pushd stack
setopt pushd_ignore_dups

# Keep recent directory stack (use cdr)
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

# Share History across shells
# setopt share_history

# Improve history searching
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

# shorter command aliases
alias ls="ls -G"
alias ll="ls -l"
alias lh="ls -lh"
alias la="ls -a"
alias grep="grep --color=auto"
#alias ocaml="rlwrap ocaml"
alias unlock="python ~/.scripts/unlock.py"

# Load scripts
source ~/.scripts/aliases.zsh
source ~/.scripts/antigen.zsh

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir pyenv vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs os_icon ram time)
# Antigen
antigen use oh-my-zsh
#antigen theme agnoster
antigen bundle git
antigen bundle djui/alias-tips
antigen theme bhilburn/powerlevel9k powerlevel9k
antigen apply

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
