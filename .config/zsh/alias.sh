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
alias bnb='bun build'
alias bns='bun start'

#-----------------------------------------------------------------------------
# imp dir to access
#-----------------------------------------------------------------------------
WORKDIR="$HOME/work/code"

alias cdw="cd $WORKDIR"
alias cdi="cd $WORKDIR/intern"
alias cdiq="cd $WORKDIR/intern/quick-hire"
alias cdp="cd $WORKDIR/projects"
alias cdp2="cd $WORKDIR/projects/web-2"
alias cdch="cd $WORKDIR/cohert"

#-----------------------------------------------------------------------------
# ls
#-----------------------------------------------------------------------------
alias ls='ls --color'
