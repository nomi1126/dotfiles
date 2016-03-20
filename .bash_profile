if [ -f ~/.bashrc ];
  then . ~/.bashrc
fi

export NVM_DIR="/Users/a12690/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

if [[ -s ~/.nvm/nvm.sh ]];
  then source ~/.nvm/nvm.sh
fi

# adb
export PATH=$PATH:/Users/a12690/Library/Android/sdk/platform-tools
export PATH=$PATH:/Users/a12690/Library/Android/sdk/tools

# Use adb-peco
export PATH=$PATH://Users/a12690/workspace/tools/adb-peco/bin
alias adb='adbp'
alias pidcat='pidcatp'

# Git Aliases
alias ga='git add'
alias gaa='git add .'
alias gaaa='git add -A'
alias gb='git branch'
alias gbd='git branch -d '
alias gc='git commit'
alias gcm='git commit -m'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcom='git checkout master'
alias gd='git diff'
alias gda='git diff HEAD'
alias gi='git init'
alias gl='git log'
alias glg='git log --graph --oneline --decorate --all'
alias gld='git log --pretty=format:"%h %ad %s" --date=short --all'
alias gm='git merge --no-ff'
alias gp='git pull'
alias gr='git rebase -i'
alias gss='git status -s'
alias gst='git stash'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gstd='git stash drop'
alias gfupr="git fetch upstream '+refs/pull/*/head:refs/pull/*'"
