alias oa='eza -a --group-directories-first'
alias o='eza --group-directories-first'
alias oo='eza -l --group-directories-first'

alias vim=nvim
alias vi=nvim
set -gx EDITOR nvim

set -gx LANG en_US.UTF-8
set -gx LC_ALL en_US.UTF-8
set -gx LC_CTYPE en_US.UTF-8

function is_nv
    if test -e /home/scratch.svc_compute_arch
        return 0
    else
        return 1
    end
end

####### PATH SETUP ########
set -px PATH ~/.cargo/bin ~/.local/bin ~/bin /opt/homebrew/bin

if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source
    direnv hook fish | source
    source ~/.homesick/repos/homeshick/homeshick.fish

    if is_nv
        set -gx ON_NV 1
        set ATUINDIR /tmp/tmp-atuin-lbzvha
        mkdir -p $ATUINDIR
        chown $USER $ATUINDIR
        chmod 700 $ATUINDIR
        mkdir -p $HOME/.local/share
        ln -sf $HOME/.local/share/atuin $ATUINDIR
        atuin init fish --disable-up-arrow | source
        atuin import auto >/dev/null 2>&1
        alias crun="/home/scratch.svc_compute_arch/release/crun/latest/crun/crun"
        alias cdb="/home/scratch.svc_compute_arch/release/cdb/latest/cdb"
    else
        atuin init fish --disable-up-arrow | source
    end

    ~/.local/bin/mise activate fish | source
    abbr -a pip -- echo "Use UV!"
end

source $HOME/.config/fish/themes/tokyonight_night.fish
