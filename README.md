# Dotfiles

This repository contains my personal configuration files (dotfiles) for both macOS and Linux systems.

## Installation

### macOS

```bash
# Copy all configs to ~/.config
cp -r mac/nvim mac/bat mac/fastfetch mac/sketchybar ~/.config/ 2>/dev/null && cp mac/starship.toml ~/.config/ 2>/dev/null && cp mac/.zshrc ~/ 2>/dev/null
```



### Omarchy Themes (Linux)

```bash
# Copy themes to ~/.config/omarchy/themes/
cp -r linux/omarchy-theme/ash linux/omarchy-theme/glassbetter linux/omarchy-theme/inkypinky ~/.config/omarchy/themes/
```

## License

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE](LICENSE) file for details.
