if [ -f ~/.bashrc ];
  then . ~/.bashrc
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

if [[ -s $HOME/.nvm/nvm.sh ]];
  then source $HOME/.nvm/nvm.sh
fi

# java_home
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

# adb
export PATH=$PATH:$HOME/Library/Android/sdk/platform-tools
export PATH=$PATH:$HOME/Library/Android/sdk/tools

# Use adb-peco
alias adb='adb-peco'

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
alias gfopr="git fetch origin '+refs/pull/*/head:refs/pull/*'"

# highlight
function light() {
  if [ -z "$2" ]; then
    src="pbpaste"
  else
    src="cat $2"
  fi
  $src | highlight -O rtf --syntax $1 --font Ricty --style fruit --font-size 24 | pbcopy
}
function light-dark() {
  if [ -z "$2" ]; then
    src="pbpaste"
  else
    src="cat $2"
  fi
  $src | highlight -O rtf --syntax $1 --font Ricty --style molokai --font-size 24 | pbcopy
}

# Postgres
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.6/bin
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
