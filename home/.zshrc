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
alias yi='sudo dnf install'
alias yu='sudo dnf update'
alias ys='dnf search'
alias bi='sudo brew install'
alias bu='sudo brew update'
alias bs='brew search'

if [[ "$OSTYPE" != "Darwin" ]]; then
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

bayesd=~/GSP/research/bayes
export PYTHONPATH=$HOME/GSP/code/jobmon:$HOME/GSP/research/bayes/samcnet

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

function bwpdf {
  /usr/bin/gs -sOutputFile=$2 -sDEVICE=pdfwrite \
    -sColorConversionStrategy=Gray -dProcessColorModel=/DeviceGray \
    -dCompatibilityLevel=1.4 -dNOPAUSE -dBATCH $1
}
