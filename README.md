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

# All
```
sudo cp $HOME/.homesick/repos/dotfiles/gitignore_global /etc
chsh --shell /bin/fish

# Install nix (use determinate's installer for uninstall capability)
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
nix profile install --stdin < $HOME/.homesick/repos/dotfiles/pkg-list.nix
cargo binstall cross cargo-edit cargo-watch atuin

atuin login -u <USERNAME>

mkdir -p $HOME/.ssh/config.d
cp $HOME/.homesick/repos/dotfiles/home/.sshconfig $HOME/.ssh/config
cp $HOME/.homesick/repos/dotfiles/home/.sshconfigaws $HOME/.ssh/config.d/aws

# Make sure to get ~/.aws/config from 1Password
# TODO: make this a CLI task using 1Password CLI
```
- Open neovim: :PluginInstall .

