#!/bin/zsh
# Aliases installer script
# Permanent install: curl -fsSL https://raw.githubusercontent.com/sichang824/aliases/main/install.sh | zsh
# Temporary (current shell only): TEMP=1 curl -fsSL https://raw.githubusercontent.com/sichang824/aliases/main/install.sh | zsh

# Check if temporary mode (check both $TEMP and command line args)
if [[ -n "$TEMP" ]] || [[ "$1" == "temp" ]] || [[ "$1" == "TEMP" ]]; then
    echo "Loading aliases temporarily (current shell only)..."
    
    # Download and source directly without saving
    if command -v curl >/dev/null 2>&1; then
        eval "$(curl -fsSL https://raw.githubusercontent.com/sichang824/aliases/main/.aliases)"
    elif command -v wget >/dev/null 2>&1; then
        eval "$(wget -qO- https://raw.githubusercontent.com/sichang824/aliases/main/.aliases)"
    else
        echo "Error: Neither curl nor wget found"
        exit 1
    fi
    
    echo "Aliases loaded temporarily! They will be gone when you close this shell."
else
    echo "Installing aliases permanently..."
    
    # Download .aliases to ~/.aliases
    if command -v curl >/dev/null 2>&1; then
        curl -fsSL https://raw.githubusercontent.com/sichang824/aliases/main/.aliases >~/.aliases
    elif command -v wget >/dev/null 2>&1; then
        wget -qO ~/.aliases https://raw.githubusercontent.com/sichang824/aliases/main/.aliases
    else
        echo "Error: Neither curl nor wget found"
        exit 1
    fi
    
    # Add source line to ~/.zshrc if not already present
    if ! grep -q "source ~/.aliases" ~/.zshrc 2>/dev/null; then
        echo "source ~/.aliases" >>~/.zshrc
        echo "Added 'source ~/.aliases' to ~/.zshrc"
    fi
    
    # Source the aliases immediately
    source ~/.aliases
    
    echo "Aliases installed and loaded!"
    echo "Restart your terminal or run 'source ~/.zshrc' to use in new sessions."
fi 