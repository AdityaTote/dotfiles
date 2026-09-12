# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
export EDITOR="nvim"
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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

# edit buffer
source ~/.config/zsh/edit_buffer.sh

eval "$(fzf --zsh)"

# hyprshot save location
HYPRSHOT_DIR="/home/reek/Pictures/Screenshots"

# bun completions
[ -s "/home/reek/.bun/_bun" ] && source "/home/reek/.bun/_bun"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="/home/reek/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

. "$HOME/.local/bin/env"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/reek/packages/google-cloud-sdk/path.zsh.inc' ]; then . '/home/reek/packages/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/reek/packages/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/reek/packages/google-cloud-sdk/completion.zsh.inc'; fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

. "$HOME/.aiken/bin/env"
export PATH="$PATH:$HOME/go/bin"
export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1
export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"

export OPENAI_API_BASE=http://localhost:11434/v1
export OPENAI_API_KEY=ollama
export OPENAI_MODEL=qwen2.5-coder
export PATH="$HOME/.cargo/bin:$PATH"
