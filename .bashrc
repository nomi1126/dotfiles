# gitの補完を有効にする
source /usr/local/etc/bash_completion.d/git-prompt.sh
source /usr/local/etc/bash_completion.d/git-completion.bash

# ターミナルにブランチ名を表示
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[33m\]\w\[\033[35m\]$(__git_ps1)\[\033[00m\]\$ '

# タブの表示形式を指定
PROMPT_COMMAND='echo -ne "\033]0;${PWD}\007"'
