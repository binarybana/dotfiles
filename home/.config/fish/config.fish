if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source

###### SHORTCUTS #####
alias oa='exa -a --group-directories-first'
alias o='exa --group-directories-first'
alias oo='exa -l --group-directories-first'
alias bc='bc -l'

alias vim=nvim
alias vi=nvim
set -gx EDITOR nvim

alias k=kubectl
alias kg="kubectl get"
alias kgp="kubectl get pods"
alias kgn="kubectl get nodes"
alias kgj="kubectl get jobs"
alias ks="--namespace=kube-system"
alias an="--all-namespaces"
alias ac="--all-containers"

set _git_log_brief_format '%C(green)%h%C(reset) %s%n%C(blue)(%ar by %an)%C(red)%d%C(reset)%n'
set _git_log_brief_format '%C(green)%h%C(reset) %s%C(red)%d%C(reset)%n'


alias git=hub
abbr -a g "git"
abbr -a ga "git add"
abbr -a gia "git add -u"
abbr -a gb "git branch"
abbr -a gbc "git checkout -b"
abbr -a gcF "git commit --verbose --amend"
abbr -a gcf "git commit --amend --reuse-message HEAD"
abbr -a gcm "git commit --message"
abbr -a gco "git checkout"
abbr -a gf "git fetch"
abbr -a gfc "git clone"
abbr -a gfm "git pull"
abbr -a gfr "git pull --rebase"
abbr -a giD "git diff --no-ext-diff --cached --word-diff"
abbr -a glb "git log --topo-order --pretty=format:$_git_log_brief_format"
abbr -a glg "git log --topo-order --all --graph --pretty=format:$_git_log_oneline_format"
abbr -a gp "git push"
abbr -a gpf "git push --force"
abbr -a gwd "git diff --no-ext-diff"
abbr -a gws "git status --short"
abbr -a gwS "git status"

function flakify
  if not test -e flake.nix
    nix flake new -t github:nix-community/nix-direnv .
    direnv allow
  else if not test -e .envrc
    echo "use flake" > .envrc
    direnv allow
  end
  $EDITOR flake.nix
end

####### PATH SETUP ########
set -x TVM_HOME $HOME/src/tvm
set -x PYTHONPATH $TVM_HOME/python $TVM_HOME/topi/python $TVM_HOME/nnvm/python $PYTHONPATH
fish_add_path ~/.cargo/bin
fish_add_path ~/.local/bin
fish_add_path ~/bin

direnv hook fish | source
source ~/.homesick/repos/homeshick/homeshick.fish
