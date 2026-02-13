# Dotfiles

This repository contains my personal configuration files (dotfiles) for both macOS and Linux systems. These configurations help maintain a consistent development environment across different machines.

## What's Included

### macOS Configs (`mac/`)
- `.zshrc` - Zsh shell configuration with custom aliases and functions
- `nvim/` - Neovim configuration (init.lua and plugins)
- `bat/` - Bat syntax highlighting themes
- `fastfetch/` - Fastfetch system information display config
- `iterm2/` - iTerm2 terminal emulator settings
- `iterm2-colors/` - iTerm2 color schemes
- `rectangle/` - Rectangle window manager settings
- `sketchybar/` - SketchyBar status bar configuration
- `starship.toml` - Starship prompt configuration

### Omarchy Themes (`linux/omarchy-theme/`)
Custom theme files for system-wide theming:
- `ash/` - Ash color scheme
- `glassbetter/` - Glassbetter theme variant
- `inkypinky/` - InkyPinky theme variant

## Prerequisites

The configurations assume the following tools are installed:
- **Common**: Neovim, bat, starship, fastfetch
- **macOS**: iTerm2, Rectangle, SketchyBar

## Installation

### macOS

```bash
# Create ~/.config if it doesn't exist
mkdir -p ~/.config

# Copy Neovim config
cp -r mac/nvim ~/.config/

# Copy Bat config
cp -r mac/bat ~/.config/

# Copy Fastfetch config
cp -r mac/fastfetch ~/.config/

# Copy SketchyBar config
cp -r mac/sketchybar ~/.config/

# Copy Starship config
cp mac/starship.toml ~/.config/

# Copy Zsh config to home directory
cp mac/.zshrc ~/

# Or copy all at once:
for dir in mac/nvim mac/bat mac/fastfetch mac/sketchybar; do
    cp -r "$dir" ~/.config/ 2>/dev/null
done
cp mac/starship.toml ~/.config/ 2>/dev/null
cp mac/.zshrc ~/ 2>/dev/null
```

**Note:** iTerm2 and Rectangle settings should be imported through their respective application GUIs.

### Omarchy Themes

```bash
# Create the omarchy themes directory
mkdir -p ~/.config/omarchy/themes

# Copy the themes
cp -r linux/omarchy-theme/* ~/.config/omarchy/themes/
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
