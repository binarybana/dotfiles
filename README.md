# Jason Dotfiles 

First make sure you have Git worthy ssh creds. Then
```
# Install Homeshick
git clone https://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
printf '\nsource $HOME/.homesick/repos/homeshick/homeshick.sh\n' >> $HOME/.zprofile
source $HOME/.zprofile

homeshick clone git@github.com:binarybana/dotfiles.git
```

## Mac
```
# Install Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    printf '%s\n' '' 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/jaknight/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
homeshick cd dotfiles
brew bundle
cp settings.json "~/Library/Application Support/Code/User/"
echo $(which fish) | sudo tee -a /etc/shells
chsh -s $(which fish)
```

## Linux
```
#Starship
curl -sS https://starship.rs/install.sh | sh

sudo apt install $(cat $HOME/.homesick/dotfiles/pkg-list.apt)
chsh --shell /bin/fish
```

# All
```
curl -LsSf https://astral.sh/uv/install.sh | sh

sudo cp $HOME/.homesick/repos/dotfiles/gitignore_global /etc
bash -c "bash <(curl https://raw.githubusercontent.com/atuinsh/atuin/main/install.sh)"

atuin login -u <USERNAME>

cp $HOME/.homesick/repos/dotfiles/home/.sshconfig $HOME/.ssh/config
```

# Optional
```
# AWS Config
mkdir -p $HOME/.ssh/config.d
cp $HOME/.homesick/repos/dotfiles/home/.sshconfigaws $HOME/.ssh/config.d/aws
# Make sure to get ~/.aws/config from 1Password
# TODO: make this a CLI task using 1Password CLI

# Rustup 
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Cargo binstall
curl -L --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/cargo-bins/cargo-binstall/main/install-from-binstall-release.sh | bash
cargo binstall cross cargo-edit cargo-watch

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
- Open neovim: :PlugInstall .

