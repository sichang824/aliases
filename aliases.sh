#!/bin/zsh
# Common aliases for zsh
# One-line install: curl -fsSL https://raw.githubusercontent.com/YOUR_USERNAME/aliases/main/aliases.sh | zsh
# Or: wget -qO- https://raw.githubusercontent.com/YOUR_USERNAME/aliases/main/aliases.sh | zsh
#
# Manual install: 
# curl -o ~/.aliases https://raw.githubusercontent.com/YOUR_USERNAME/aliases/main/aliases.sh
# echo "source ~/.aliases" >> ~/.zshrc && source ~/.zshrc

# Directory navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'
alias -- -='cd -'

# List files (macOS compatible)
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
if [[ "$OSTYPE" == "darwin"* ]]; then
    alias ls='ls -G'  # macOS
else
    alias ls='ls --color=auto'  # Linux
fi

# Grep with color
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# File operations
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias mkdir='mkdir -pv'

# Process management
alias ps='ps auxf'
alias psg='ps aux | grep -v grep | grep -i -e VSZ -e'
if command -v htop >/dev/null 2>&1; then
    alias top='htop'
fi

# Network
alias ping='ping -c 5'
if [[ "$OSTYPE" == "darwin"* ]]; then
    alias ports='netstat -an | grep LISTEN'  # macOS
else
    alias ports='netstat -tulanp'  # Linux
fi

# Docker shortcuts
alias d='docker'
alias dc='docker-compose'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias di='docker images'
alias dex='docker exec -it'
alias dlog='docker logs -f'

# Git shortcuts
alias g='git'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'
alias gd='git diff'
alias gb='git branch'
alias gco='git checkout'
alias glog='git log --oneline --graph --decorate'

# System info
alias df='df -h'
alias du='du -h'
if [[ "$OSTYPE" != "darwin"* ]]; then
    alias free='free -h'  # Not available on macOS
fi
alias path='echo -e ${PATH//:/\\n}'

# Quick edits
alias vi='vim'
alias nano='nano -w'

# Safety nets (Linux only)
if [[ "$OSTYPE" != "darwin"* ]]; then
    alias chown='chown --preserve-root'
    alias chmod='chmod --preserve-root'
    alias chgrp='chgrp --preserve-root'
fi

# Misc
alias h='history'
alias j='jobs -l'
alias c='clear'
alias reload='source ~/.zshrc'

# Package management (OS-specific)
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS with Homebrew
    if command -v brew >/dev/null 2>&1; then
        alias install='brew install'
        alias search='brew search'
        alias update='brew update && brew upgrade'
    fi
elif command -v apk >/dev/null 2>&1; then
    # Alpine Linux
    alias install='apk add'
    alias search='apk search'
    alias update='apk update && apk upgrade'
elif command -v apt >/dev/null 2>&1; then
    # Debian/Ubuntu
    alias install='sudo apt install'
    alias search='apt search'
    alias update='sudo apt update && sudo apt upgrade'
elif command -v yum >/dev/null 2>&1; then
    # RHEL/CentOS
    alias install='sudo yum install'
    alias search='yum search'
    alias update='sudo yum update'
fi

# Auto-install to ~/.zshrc if run directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]] || [[ "${(%):-%x}" == "${0}" ]]; then
    echo "Installing aliases to ~/.zshrc..."
    
    # Download to ~/.aliases
    if command -v curl >/dev/null 2>&1; then
        curl -fsSL https://raw.githubusercontent.com/YOUR_USERNAME/aliases/main/aliases.sh > ~/.aliases
    elif command -v wget >/dev/null 2>&1; then
        wget -qO ~/.aliases https://raw.githubusercontent.com/YOUR_USERNAME/aliases/main/aliases.sh
    else
        echo "Error: Neither curl nor wget found"
        exit 1
    fi
    
    # Add source line to ~/.zshrc if not already present
    if ! grep -q "source ~/.aliases" ~/.zshrc 2>/dev/null; then
        echo "source ~/.aliases" >> ~/.zshrc
        echo "Added 'source ~/.aliases' to ~/.zshrc"
    fi
    
    # Source the aliases
    source ~/.aliases
    echo "Aliases installed and loaded!"
else
    echo "Aliases loaded! Use 'alias' to see all available aliases."
fi 