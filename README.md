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
sudo apt install (cat pkg-list.apt)
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
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
chsh --shell /bin/fish
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install cross cargo-edit cargo-watch just
curl -fsSL https://starship.rs/install.sh | bash
curl -LO https://dl.k8s.io/release/(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

```
- Open vim: `:PluginInstall` Or `PlugInstall` for neovim apparently.

