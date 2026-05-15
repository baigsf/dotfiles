# EZA CONFIG
alias eza='eza --color=auto'
alias ls='eza --icons --color=always --group-directories-first'
alias ls='eza -l --icons --color=always --group-directories-first'
alias la='eza -la --icons --color=always --group-directories-first'
alias lt='eza -T --icons --color=always --group-directories-first'

# ALIAS
alias ff="fastfetch"
alias cat='bat'
alias cd='z'
alias vim='nvim'
alias ts='tailscale'

# FZF
source <(fzf --zsh)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# STARSHIP
eval "$(starship init zsh)"

# ZOXIDE
eval "$(zoxide init zsh)"

# FOR SCRIPTS
export PATH="$HOME/.local/bin:$PATH"

# HUSH BREW
export HOMEBREW_NO_ENV_HINTS=1

