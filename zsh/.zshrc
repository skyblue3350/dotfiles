autoload -Uz compinit && compinit
zstyle ':completion:*:default' menu select=1
setopt auto_list

# install zsh plugins
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "zsh-users/zsh-syntax-highlighting", as:plugin
zplug "zsh-users/zsh-history-substring-search", as:plugin
zplug "zsh-users/zsh-autosuggestions", as:plugin
zplug "zsh-users/zsh-completions", as:plugin

if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

zplug load

HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

export DISPLAY=localhost:0.0
export EDITOR=vim
export FZF_DEFAULT_OPTS='--layout=reverse'

eval "$(anyenv init -)"

function peco-ghq () {
  local selected_dir=$(ghq list -p | fzf)
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-ghq
bindkey '®' peco-ghq
bindkey ';2C' forward-word
bindkey ';2D' backward-word

cdls() {
    \cd "$@" && ls -l
}

alias ls='ls -l'
alias cd='cdls'
alias grep='grep --color'
alias df='df -h'
alias diff='diff -c'
alias dc='docker-compose'

