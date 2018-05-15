# modify the prompt to contain git branch name if applicable
git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null)
  if [[ -n $ref ]]; then
    echo "[%{$fg_bold[green]%}${ref#refs/heads/}%{$reset_color%}]"
  fi
}
setopt promptsubst
export PS1='$(git_prompt_info)[${SSH_CONNECTION+"%{$fg_bold[green]%}%n@%m:"}%{$fg_bold[blue]%}%~%{$reset_color%}] '

# history settings
setopt histignoredups
HISTFILE=~/.zsh_history
HISTSIZE=4096
SAVEHIST=4096

# Try to correct command line spelling
setopt correct correctall

export VISUAL=vim
export EDITOR=$VISUAL

export BROWSER=open

# mkdir .git/safe in the root of repositories you trust
export PATH=".git/safe/../../bin:$PATH"

#http://stackoverflow.com/questions/3964068/zsh-automatically-run-ls-after-every-cd
function chpwd() {
    emulate -L zsh
    ls --color
}
# Oh-MyZSH !!
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME='dpoggi'
MODE_INDICATOR="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
COMPLETION_WAITING_DOTS="true"
plugins=(git git-extras rails ruby gem common-aliases npm vi-mode command-not-found tmux extract cp dirhistory heroku z)
source $ZSH/oh-my-zsh.sh
# Custom theme :-D
export ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%} "
export ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}○%{$reset_color%}"
export ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}⚡%{$reset_color%}"
export ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[yellow]%}%{$reset_color%}"

export DISABLE_AUTO_TITLE=true
# unsetopt correct_all

alias n="nautilus --no-desktop ./"
alias h="heroku"
alias hc="heroku run rails c -r "
alias gup='git smart-pull'
alias gm='git smart-merge'
alias gl='git smart-log'
alias dbtest='RAILS_ENV=test rake db:drop db:create db:migrate'

alias sshs="ssh-add -D && ssh-add "

export CDPATH="~:~/public_html/"

export KEYTIMEOUT=1
RPS1='$(vi_mode_prompt_info)${return_code}'

export PATH="./bin:$PATH"

#SSH Agent Startup Modified from: http://mah.everybody.org/docs/ssh#run-ssh-agent
SSH_ENV="${HOME}/.ssh/environment"
start_agent() {
  echo "Initialising new SSH agent..."
  if [ ! -d ${HOME}/.ssh ] ;then
    mkdir -p ${HOME}/.ssh
    chmod 700 ${HOME}/.ssh
    touch ${SSH_ENV}
  fi
  /usr/bin/ssh-agent | sed 's/^echo/#echo/' >"${SSH_ENV}"
  rval=${?}
  if [ ${rval} = 0 ] ;then
    echo "Succeeded!"
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" >/dev/null
    /usr/bin/ssh-add
  else
    echo "Failed to write ${SSH_ENV}"
  fi
}
# if [[ -z "$TMUX" ]] ;then
#    ID="`tmux ls | grep -vm1 attached | cut -d: -f1`" # get the id of a deattached session
#     if [[ -z "$ID" ]] ;then # if not available create a new one
#        tmux new-session
#    else
#        tmux attach-session -t "$ID" # if available attach to it
#    fi
# fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
