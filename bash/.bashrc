function peco-ghq() {
  local selected_dir=$(ghq list -p | fzf --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    cd ${selected_dir}
  fi
}

function peco-ssh() {
  local selected_host=$(cat ~/.ssh/config | grep "Host " | awk '{print $2}' | fzf)
  if [ -n "${selected_host}" ]; then
    ssh ${selected_host}
  fi
}

export PATH=~/ghq/github.com/anyenv/anyenv/bin:$PATH
eval "$(anyenv init -)"

export EDITOR=vim

cd ~

export DISPLAY=localhost:0.0
