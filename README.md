# Shell Aliases Collection

A comprehensive collection of useful shell aliases for zsh, optimized for cross-platform compatibility (macOS, Linux).

## Quick Install

### Permanent install (recommended):
```bash
curl -fsSL https://raw.githubusercontent.com/sichang824/aliases/main/install.sh | zsh
```

Or with wget:
```bash
wget -qO- https://raw.githubusercontent.com/sichang824/aliases/main/install.sh | zsh
```

### Temporary install (current shell only):
```bash
TEMP=1 curl -fsSL https://raw.githubusercontent.com/sichang824/aliases/main/install.sh | zsh
```

Or with wget:
```bash
TEMP=1 wget -qO- https://raw.githubusercontent.com/sichang824/aliases/main/install.sh | zsh
```

Alternative (pass argument):
```bash
curl -fsSL https://raw.githubusercontent.com/sichang824/aliases/main/install.sh | zsh -s temp
```

### Manual install:
```bash
curl -o ~/.aliases https://raw.githubusercontent.com/sichang824/aliases/main/.aliases
echo "source ~/.aliases" >> ~/.zshrc
source ~/.zshrc
```

## Features

- **Cross-platform**: Automatically detects macOS vs Linux and adjusts commands accordingly
- **Package manager detection**: Supports Homebrew, APT, YUM, APK
- **Safe defaults**: Interactive prompts for destructive operations
- **Git shortcuts**: Common git commands with short aliases
- **Docker shortcuts**: Quick docker and docker-compose commands
- **Smart conditionals**: Only creates aliases for installed tools

## Included Aliases

### Navigation
- `..`, `...`, `....` - Go up directories
- `-` - Go to previous directory

### File Operations
- `ll`, `la`, `l` - Various ls formats
- `cp`, `mv`, `rm` - Interactive file operations
- `mkdir` - Create directories with parents

### Git
- `g` - git
- `gs` - git status
- `ga` - git add
- `gc` - git commit
- `gp` - git push
- `gl` - git pull
- `gd` - git diff
- `gb` - git branch
- `gco` - git checkout
- `glog` - pretty git log

### Docker
- `d` - docker
- `dc` - docker-compose
- `dps` - docker ps
- `dpsa` - docker ps -a
- `di` - docker images
- `dex` - docker exec -it
- `dlog` - docker logs -f

### System
- `df`, `du` - Disk usage (human readable)
- `free` - Memory usage (Linux only)
- `ps` - Process list
- `top` - htop if available
- `ports` - Show listening ports

### Package Management
- `install` - Install packages (brew/apt/yum/apk)
- `search` - Search packages
- `update` - Update system packages

### Misc
- `h` - history
- `c` - clear
- `reload` - reload zsh config
- `path` - show PATH entries

## Customization

Edit `~/.aliases` after installation to add your own aliases, or fork this repo and modify `aliases.sh`.

## Uninstall

Remove the source line from `~/.zshrc` and delete `~/.aliases`:
```bash
sed -i '' '/source ~\/.aliases/d' ~/.zshrc
rm ~/.aliases
``` 