# .zshrc - Zsh configuration file
source ~/.config/zsh/zinit.sh

# key bindings
source ~/.config/zsh/keybindings.sh

# historical search
source ~/.config/zsh/historical_search.sh

# styling
source ~/.config/zsh/style.sh

# alias
source ~/.config/zsh/alias.sh

eval "$(fzf --zsh)"

# bun completions
[ -s "/home/reek/.bun/_bun" ] && source "/home/reek/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
