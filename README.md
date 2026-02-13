# Dotfiles

This repository contains my personal configuration files (dotfiles) for both macOS and Linux systems.

## Installation

### macOS

```bash
# Copy all configs to ~/.config
cp -r mac/nvim mac/bat mac/fastfetch mac/sketchybar ~/.config/ 2>/dev/null && cp mac/starship.toml ~/.config/ 2>/dev/null && cp mac/.zshrc ~/ 2>/dev/null
```

**Note:** iTerm2 and Rectangle settings should be imported through their respective application GUIs.

### Omarchy Themes (Linux)

```bash
# Copy themes to ~/.config/omarchy/themes/
mkdir -p ~/.config/omarchy/themes && cp -r linux/omarchy-theme/* ~/.config/omarchy/themes/
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
