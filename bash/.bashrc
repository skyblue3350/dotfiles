# ----------------------------------
# functions
# ----------------------------------

cdls() {
    \cd "$@" && ls -l
}

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

setupPS1(){
	getGitBranch(){
		git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
	}

	# define color
	local GREEN="\[\033[01;32m\]"
	local BLUE="\[\033[01;34m\]"
	local WHITE="\[\033[00m\]"

	# define var
	local USER="\u"
	local HOST="\h"
	local PWD="\w"
	local TITLE="\[\e]0;${USER}@${HOST}: \w\a\]"

	export PS1="${GREEN}${USER}@${HOST}${WHITE}:${BLUE}${PWD}${WHITE}\$(getGitBranch)${TITLE}\n\$ "
}


# ----------------------------------
# alias
# ----------------------------------
alias cd='cdls'
alias grep='grep --color'
alias df='df -h'

# ----------------------------------
# environment variables
# ----------------------------------
export DISPLAY=localhost:0.0
export EDITOR=vim
export FZF_DEFAULT_OPTS='--layout=reverse'

# ----------------------------------
# other
# ----------------------------------
setupPS1

# ----------------------------------
# init tools
# ----------------------------------
if [ -d ~/.ghq/github.com/anyenv/anyenv ] ; then
    export PATH=~/.ghq/github.com/anyenv/anyenv/bin:$PATH
    eval "$(anyenv init -)"
fi
