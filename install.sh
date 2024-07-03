#! /usr/bin/env bash
set -o errexit   # abort on nonzero exitstatus
set -o nounset   # abort on unbound variable
set -o pipefail  # don't hide errors within pipes
set -x # Debug printing

PLATFORM=$(uname -s)


if [ ! -d $HOME/.homesick/repos/homeshick ]; then
    git clone https://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
    printf '\nsource $HOME/.homesick/repos/homeshick/homeshick.sh\n' >> $HOME/.bashrc
fi
source $HOME/.homesick/repos/homeshick/homeshick.sh

if [ ! -d $HOME/.homesick/repos/dotfiles ]; then
    # TODO: automatically fall back to https if we don't have ssh github creds
    homeshick clone -b git@github.com:binarybana/dotfiles.git
    homeshick link -fb dotfiles
fi

if [ "$PLATFORM" == "Linux" ];
then
    echo "binarybana/dotfiles: Installing only the essentials here"
    echo "binarybana/dotfiles: see `install_phase2.sh` for everything else"
    sudo apt update
    sudo apt install -y $(cat $HOME/.homesick/repos/dotfiles/pkg-list-essential.apt)
elif [ "$PLATFORM" == "Darwin" ];
then
    # Install Brew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    homeshick cd dotfiles
    brew bundle
    cp $HOME/.homesick/repos/dotfiles/home/.config/Code/User/settings.json "~/Library/Application Support/Code/User/"
    cd $HOME
else
    echo "Platform $PLATFORM not supported"
    exit -1
fi

sudo cp $HOME/.homesick/repos/dotfiles/gitignore_global /etc
sudo chsh "$(id -un)" --shell "/usr/bin/fish"

# Cargo binstall
mkdir -p $HOME/.cargo/bin
curl -L --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/cargo-bins/cargo-binstall/main/install-from-binstall-release.sh | bash

pushd $HOME/bin
# Workaround binstall issue for atuin https://github.com/cargo-bins/cargo-binstall/issues/1806
# $HOME/.cargo/bin/cargo-binstall -y atuin
wget https://github.com/atuinsh/atuin/releases/download/v18.3.0/atuin-x86_64-unknown-linux-gnu.tar.gz
tar xzf atuin-x86_64-unknown-linux-gnu.tar.gz
mv atuin-x86_64-unknown-linux-gnu atuin
rm atuin-x86_64-unknown-linux-gnu.tar.gz

# Install diff-so-fancy
wget https://github.com/so-fancy/diff-so-fancy/archive/refs/tags/v1.4.4.tar.gz
tar xzf v1.4.4.tar.gz
rm v1.4.4.tar.gz
ln -sf diff-so-fancy-1.4.4/diff-so-fancy .
popd

# Starship
curl -sS https://starship.rs/install.sh | sh -s -- --yes

mkdir -p $HOME/.ssh/config.d
cp $HOME/.homesick/repos/dotfiles/home/.sshconfig $HOME/.ssh/config
cp $HOME/.homesick/repos/dotfiles/home/.sshconfig_aws $HOME/.ssh/config.d/aws

set +x
echo "binarybana/dotfiles: Now run ./$HOME/.homesick/repos/dotfiles/install_interactive.sh"
echo "binarybana/dotfiles: for interactive install"
