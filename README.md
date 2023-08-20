# Jason Dotfiles 

First make sure you have Git worthy ssh creds. Then
```
# Install Homeshick
git clone https://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
printf '\nsource $HOME/.homesick/repos/homeshick/homeshick.sh\n' >> $HOME/.bashrc
source $HOME/.bashrc

homeshick clone git@github.com:binarybana/dotfiles.git
```

## Mac
```
# Install Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
homeshick cd dotfiles
brew bundle
cp settings.json "~/Library/Application Support/Code/User/"

# Poetry
curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | python
```

## Ubuntu
```
sudo apt install $(cat $HOME/.homesick/dotfiles/pkg-list.apt)
```

## Fedora
```
sudo dnf install $(cat $HOME/.homesick/repos/dotfiles/pkg-list.dnf)
sudo dnf install -y https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
sudo dnf install --nogpgcheck -y http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

# All
```
sudo cp $HOME/.homesick/repos/dotfiles/gitignore_global /etc
chsh --shell /bin/fish

# Install nix
sh <(curl -L https://nixos.org/nix/install) --no-daemon
nix profile install --stdin < $HOME/.homesick/repos/dotfiles/pkg-list.nix
cargo binstall cross cargo-edit cargo-watch atuin

atuin login -u <USERNAME>

# Make sure to get ~/.aws/config from 1Password
# TODO: make this a CLI task using 1Password CLI
# Reminder: aws sso login --profile sandbox
```
- Open neovim: :PluginInstall .

