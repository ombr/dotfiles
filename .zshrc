# TMUX
if [[ -z "$TMUX" ]] ;then
    ID="`tmux ls | grep -vm1 attached | cut -d: -f1`" # get the id of a deattached session
    if [[ -z "$ID" ]] ;then # if not available create a new one
        tmux new-session
    else
        tmux attach-session -t "$ID" # if available attach to it
    fi
fi

# completion
autoload -U compinit
compinit

# makes color constants available
autoload -U colors
colors

# enable colored output from ls, etc
export CLICOLOR=1

# history settings
setopt histignoredups
HISTFILE=~/.zsh_history
HISTSIZE=4096
SAVEHIST=4096

# awesome cd movements from zshkit
setopt autocd autopushd pushdminus pushdsilent pushdtohome cdablevars
DIRSTACKSIZE=5

# Try to correct command line spelling
setopt correct

# Enable extended globbing
setopt extendedglob

# Allow [ or ] whereever you want
unsetopt nomatch

# vi mode
bindkey -v
bindkey "^F" vi-cmd-mode
bindkey jj vi-cmd-mode

# handy keybindings
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^R" history-incremental-search-backward
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word
bindkey -s "^T" "^[Isudo ^[A" # "t" for "toughguy"

# use vim as the visual editor
export VISUAL=vim
export EDITOR=$VISUAL

export BROWSER=firefox

# mkdir .git/safe in the root of repositories you trust
export PATH=".git/safe/../../bin:$PATH"

export PATH="$HOME/.bin:$PATH"



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
# plugins=(git git-extras github rails ruby gem common-aliases npm vi-mode command-not-found tmux extract cp dirhistory heroku z github)
# plugins=(git git-extras rails ruby gem common-aliases npm vi-mode command-not-found tmux extract cp dirhistory heroku z)
plugins=()
source $ZSH/oh-my-zsh.sh
# Custom theme :-D
export ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%} "
export ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}○%{$reset_color%}"
export ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}⚡%{$reset_color%}"
export ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[yellow]%}%{$reset_color%}"

# alias n="nautilus --no-desktop ./"
alias h="heroku"
alias g="git"
alias gp="git push"
alias dc='docker-compose'
alias dcr='dc run'
alias kb='setxkbmap -rules evdev -model evdev -layout us -variant altgr-intl'
alias dcu='dc up'
alias hc="heroku run rails c -r "
alias gup='git smart-pull'
alias gm='git smart-merge'
alias gl='git smart-log'
alias dbtest='RAILS_ENV=test rake db:drop db:create db:migrate'

export CDPATH="~:~/public_html/"

export KEYTIMEOUT=1
RPS1='$(vi_mode_prompt_info)${return_code}'

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# RBENV
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export DISABLE_AUTO_TITLE=true

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /home/ombr/public_html/chromeless/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /home/ombr/public_html/chromeless/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /home/ombr/public_html/chromeless/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /home/ombr/public_html/chromeless/serverless/node_modules/tabtab/.completions/sls.zsh