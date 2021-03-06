#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
zstyle ':completion:*' accept-exact-dirs 'yes'

autoload -Uz promptinit
promptinit
prompt steeef

bindkey -v

bindkey '\e.' insert-last-word
alias la='ls -al'
alias l='ls'
alias ll='ls -lh'
alias lll=longlist
alias waf='./waf'

alias oa='la'
alias o='l'
alias oo='ll'
alias ooo='lll'

alias -g L='--color=always | less -r'

alias bc='bc -l'
alias as='apt-cache search'
alias au='sudo apt-get update && sudo apt-get upgrade'
alias ai='sudo apt-get install'
alias di='sudo dnf install'
alias dii='sudo dnf install -y'
alias dup='sudo dnf update'
alias ds='dnf search'
alias bi='sudo brew install'
alias bu='sudo brew update'
alias bs='brew search'

if [[ -z /bin/gvim ]]; then
  alias vim='gvim -v'
fi
alias essh='vim ~/.ssh/config'
alias ez='vim ~/.zshrc'
alias sz='. ~/.zshrc'
alias ezt='vim ~/$ZSH_CUSTOM/$ZSH_THEME.zsh-theme'

alias tmux='tmux -2'

alias echolast='tail -n 2 ~/.zsh_history | head -n 1| cut -d ";" -f 2- -'

alias parallel='parallel --gnu'

source $HOME/.homesick/repos/homeshick/homeshick.sh

function longlist {
  ls -Shla --color=always "$1" | less -r
}

function psg {
  ps ax | grep $1
}

function ag {
  alias | grep $1
}

alias lgfr="git fetch repo.git;git reset FETCH_HEAD"

#From http://www.zsh.org/mla/users/1999/msg00632.html
function ext_glob {
    setopt localoptions extendedglob
    local command="$1"
    shift
    $==command $==~*      # redo globbing on arguments
}
alias extglob='noglob ext_glob '  # delay globbing until inside

export PATH=$HOME/bin:$PATH
export TIMEFMT="%U user   %MMB memory   %P cpu   %*E total - %J"


bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

function bwpdf {
  /usr/bin/gs -sOutputFile=$2 -sDEVICE=pdfwrite \
    -sColorConversionStrategy=Gray -dProcessColorModel=/DeviceGray \
    -dCompatibilityLevel=1.4 -dNOPAUSE -dBATCH $1
}

function s3du(){
  bucket=`cut -d/ -f3 <<< $1`
  prefix=`awk -F/ '{for (i=4; i<NF; i++) printf $i"/"; print $NF}' <<< $1`
  aws s3api list-objects --bucket $bucket --prefix=$prefix --output json --query '[sum(Contents[].Size), length(Contents[])]' | jq '. |{ size:.[0],num_objects: .[1]}'
}

setopt interactivecomments

bindkey -e

# export GOPATH=$HOME/src/gocode
# export GOROOT=$HOME/src/go
# export GOBIN=$HOME/src/go/bin
# export PATH=$PATH:$GOBIN
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias vim=nvim
alias vi=nvim
alias k=kubectl
alias kg="kubectl get"
alias kgp="kubectl get pods"
alias kgn="kubectl get nodes"
alias kgj="kubectl get jobs"
alias -g ks="--namespace=kube-system"
alias vim=nvim

alias venv='source $HOME/.local/venv3/bin/activate'
# export RUSTFLAGS="-C target-cpu=native -C link-arg=-fuse-ld=lld"
export RUSTFLAGS="-C target-cpu=native"

export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:/Users/jason/programs/google-cloud-sdk/bin
# export GOOGLE_APPLICATION_CREDENTIALS=$HOME/src/attic-fan-control-pi/data-fetcher.json

alias git=hub

if [ /usr/local/bin/kubectl ]; then source <(kubectl completion zsh); fi

export RUST_SRC_PATH=$HOME/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src

if [[ -f /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc ]]; then
  source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
  source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
fi

export TVM_HOME=$HOME/src/incubator-tvm
export PYTHONPATH=$TVM_HOME/python:$TVM_HOME/topi/python:$TVM_HOME/nnvm/python:${PYTHONPATH}

eval "$(starship init zsh)"
