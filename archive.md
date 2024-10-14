
# AWS Config
```
mkdir -p $HOME/.ssh/config.d
cp $HOME/.homesick/repos/dotfiles/home/.sshconfigaws $HOME/.ssh/config.d/aws
# Make sure to get ~/.aws/config from 1Password
# TODO: make this a CLI task using 1Password CLI

cargo binstall cross cargo-edit bacon

# Plug Install
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

##########
# OR #####
##########

# Install nix (use determinate's installer for uninstall capability)
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
nix profile install --stdin < $HOME/.homesick/repos/dotfiles/pkg-list.nix
```

From a Dockerfile for passwordless sudo:
```
sudo bash -c "cat <<<'jaknight ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/jaknight"
```
