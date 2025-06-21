# .zshrc - Zsh configuration file
source .config/zsh/zinit.sh

# key bindings
source .config/zsh/keybindings.sh

# historical search
source .config/zsh/historical_search.sh

# styling
source .config/zsh/style.sh

# alias
source .config/zsh/alias.sh

eval "$(fzf --zsh)"
