#! /usr/bin/env bash
set -o errexit   # abort on nonzero exitstatus
set -o nounset   # abort on unbound variable
set -o pipefail  # don't hide errors within pipes
set -x # Debug printing

PLATFORM=$(uname-s)

git clone https://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
printf '\nsource $HOME/.homesick/repos/homeshick/homeshick.sh\n' >> $HOME/.bashrc
source $HOME/.bashrc

# TODO: automatically fall back to https if we don't have ssh github creds
homeshick clone git@github.com:binarybana/dotfiles.git

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

sudo cp $HOME/.homesick/repos/dotfiles/gitignore_global /etc
chsh --shell /bin/fish

# Cargo binstall
curl -L --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/cargo-bins/cargo-binstall/main/install-from-binstall-release.sh | bash
cargo binstall atuin

# Install diff-so-fancy
pushd $HOME/bin
wget https://github.com/so-fancy/diff-so-fancy/archive/refs/tags/v1.4.4.tar.gz
tar xzf v1.4.4.tar.gz
rm v1.4.4.tar.gz
ln -s diff-so-fancy-1.4.4/diff-so-fancy .
popd

mkdir -p $HOME/.ssh/config.d
cp $HOME/.homesick/repos/dotfiles/home/.sshconfig $HOME/.ssh/config
cp $HOME/.homesick/repos/dotfiles/home/.sshconfigaws $HOME/.ssh/config.d/aws

echo "binarybana/dotfiles: Now run ./$HOME/.homesick/repos/dotfiles/install_interactive.sh"
echo "binarybana/dotfiles: for interactive install"
