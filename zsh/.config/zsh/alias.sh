#-----------------------------------------------------------------------------
# git
#-----------------------------------------------------------------------------
alias gint='git init'
alias gs='git status -s'
alias gcl='git clone'
alias ga='git add'
alias gaa='git add .'
alias gc='git commit -m'
alias gac='gaa && gc'
alias gpsh='git push origin HEAD'
alias gpsd='git push origin dev'
alias gpsm='git push origin main'
alias gb='git branch'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gpl='git pull origin'
alias gpld='gpl dev'
alias gr='git remote origin'

#-----------------------------------------------------------------------------
# npm
#-----------------------------------------------------------------------------
alias nint='npm init --y'
alias ni='npm install'
alias nd='npm run dev'
alias nb='npm run build'
alias ns='npm run start'

#-----------------------------------------------------------------------------
# pnpm
#-----------------------------------------------------------------------------
alias pnit='pnpm init'
alias pna='pnpm add'
alias pni='pnpm install'
alias pnd='pnpm dev'
alias pnb='pnpm build'
alias pns='pnpm start'

#-----------------------------------------------------------------------------
# bun
#-----------------------------------------------------------------------------
alias bnit='bun init'
alias bna='bun add'
alias bni='bun install'
alias bnd='bun dev'
alias bnb='bun run build'
alias bns='bun start'

#-----------------------------------------------------------------------------
# imp dir to access
#-----------------------------------------------------------------------------
WORKDIR="$HOME/work/code"
HOMEDIR="$HOME"

alias cdw="cd $WORKDIR"
alias cdi="cd $WORKDIR/intern"
alias ece="cd $WORKDIR/intern/Ec"
alias cdp="cd $WORKDIR/projects"
alias cdch="cd $WORKDIR/cohert"
alias cdh="cd $WORKDIR/HiFi"
alias cdr="cd $WORKDIR/rookie-house"
alias cdd="cd $HOMEDIR/dotfiles"

#-----------------------------------------------------------------------------
# tmux
#-----------------------------------------------------------------------------
alias t='tmux'
alias tl='t ls'
alias ta='t attach'

#-----------------------------------------------------------------------------
# ls
#-----------------------------------------------------------------------------
alias ls='ls --color'

#-----------------------------------------------------------------------------
# nvidia specific applications (high performance)
#   --------------------------------------------------------------------------
alias cursor='/usr/share/cursor/cursor'
alias coh='prime-run code'
alias cuh='prime-run cursor'
alias hzen='prime-run zen-browser'
alias hzed='prime-run zed'
