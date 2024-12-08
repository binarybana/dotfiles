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

mkdir -p $HOME/bin

if [ "$PLATFORM" == "Linux" ];
then
    sudo apt update
    sudo apt install -y $(cat $HOME/.homesick/repos/dotfiles/pkg-list-essential.apt)
    sudo chsh "$(id -un)" --shell "/usr/bin/fish"
elif [ "$PLATFORM" == "Darwin" ];
then
    # Install Brew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    homeshick cd dotfiles
    brew bundle
    cp $HOME/.homesick/repos/dotfiles/home/.config/Code/User/settings.json "~/Library/Application Support/Code/User/"
    cd $HOME
    echo $(which fish) | sudo tee -a /etc/shells
    chsh -s $(which fish)
else
    echo "Platform $PLATFORM not supported"
    exit -1
fi

sudo cp $HOME/.homesick/repos/dotfiles/gitignore_global /etc

# Astral's uv (amazeballs!)
curl -LsSf https://astral.sh/uv/install.sh | sh
$HOME/.local/bin/uv tool install ruff
# uv tool install pyright

# Cargo binstall
mkdir -p $HOME/.cargo/bin
curl -L --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/cargo-bins/cargo-binstall/main/install-from-binstall-release.sh | bash

# INSTALL BINARIES
pushd $HOME/bin

# Workaround binstall issue for atuin https://github.com/cargo-bins/cargo-binstall/issues/1806
# $HOME/.cargo/bin/cargo-binstall -y atuin
bash -c "bash <(curl https://raw.githubusercontent.com/atuinsh/atuin/main/install.sh)"

# Install diff-so-fancy
wget https://github.com/so-fancy/diff-so-fancy/archive/refs/tags/v1.4.4.tar.gz
tar xzf v1.4.4.tar.gz
rm v1.4.4.tar.gz
ln -sf diff-so-fancy-1.4.4/diff-so-fancy .

# Install up to date neovim
if [ "$PLATFORM" == "Linux" ];
then
wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
tar xzf nvim-linux64.tar.gz
ln -s nvim-linux64/bin/nvim .
elif [ "$PLATFORM" == "Darwin" ];
then
wget https://github.com/neovim/neovim/releases/download/stable/nvim-macos-arm64.tar.gz
tar xzf nvim-macos-arm64.tar.gz
ln -s nvim-macos-arm64/bin/nvim .
fi

# NO MORE BINARIES IN $HOME/bin
popd

# Delta (git diffing)
$HOME/.cargo/bin/cargo-binstall -y git-delta

# Starship
curl -sS https://starship.rs/install.sh | sh -s -- --yes

mkdir -p $HOME/.ssh/config.d
cp $HOME/.homesick/repos/dotfiles/home/.sshconfig $HOME/.ssh/config

set +x
echo "binarybana/dotfiles: Now run ./$HOME/.homesick/repos/dotfiles/install_interactive.sh"
echo "binarybana/dotfiles: for interactive portions of the install"
