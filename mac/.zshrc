# EZA CONFIG
export LS_COLORS="no=1;35:fi=1;35:di=1;35:ln=1;35:pi=1;35:so=1;35:bd=1;35:cd=1;35:or=1;35:mi=1;35:ex=1;35:*.txt=1;35:*.md=1;35:*.sh=1;35:*.lua=1;35:*.py=1;35:*.js=1;35:*.json=1;35:*.cs=1;35:*.java=1;35"
alias ls='eza --icons --color=always --group-directories-first'
alias ll='eza -l --icons --color=always --group-directories-first'
alias la='eza -la --icons --color=always --group-directories-first'
alias lt='eza -T --icons --color=always --group-directories-first'

# ALIAS
alias neofetch='fastfetch'
alias cat="bat"
alias vf='nvim "$(fzf --preview "bat --color=always {}")"'

ts() {
  case "$1" in
    albion)
      shift
      tailscale up "$@"
      ;;
    *)
      tailscale "$@"
      ;;
  esac
}

# FZF
source <(fzf --zsh)

# STARSHIP
eval "$(starship init zsh)"


export PATH="/Users/saifbaig/.local/bin:$PATH"
