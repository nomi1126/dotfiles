# gitの補完を有効にする
source /usr/local/etc/bash_completion.d/git-prompt.sh
source /usr/local/etc/bash_completion.d/git-completion.bash

# ターミナルにブランチ名を表示
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[33m\]\w\[\033[35m\]$(__git_ps1)\[\033[00m\]\$ '

# タブの表示形式を指定
PROMPT_COMMAND='echo -ne "\033]0;${PWD}\007"'

export NVM_DIR="/Users/a12690/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /Users/r21nomi/.nvm/versions/node/v8.11.2/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash ] && . /Users/r21nomi/.nvm/versions/node/v8.11.2/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /Users/r21nomi/.nvm/versions/node/v8.11.2/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash ] && . /Users/r21nomi/.nvm/versions/node/v8.11.2/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[ -f /Users/r21nomi/.nvm/versions/node/v10.15.0/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.bash ] && . /Users/r21nomi/.nvm/versions/node/v10.15.0/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.bash
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
