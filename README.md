# Jason Dotfiles 

First make sure you have Git worthy ssh creds. Then
```
# Install Homeshick
git clone git://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
printf '\nsource $HOME/.homesick/repos/homeshick/homeshick.sh\n' >> $HOME/.bashrc
source $HOME/.bashrc

homeshick clone git@github.com:binarybana/dotfiles.git
```

## Mac
```
homeshick cd dotfiles
brew bundle
cp settings.json "~/Library/Application Support/Code/User/"

# Poetry
curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | python
```

## Ubuntu
```
sudo pip install $(cat $HOME/.homesick/repos/dotfiles/pip-list)
```

## Fedora
```
sudo dnf install $(cat $HOME/.homesick/repos/dotfiles/pkg-list.dnf)
sudo dnf install -y https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
sudo dnf install --nogpgcheck -y http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Font rendering in fedora from:
# https://www.happyassassin.net/2014/01/17/fonts-and-font-sizes-in-fedora-on-the-internet-hold-onto-your-hats/
```

# All

- Open vim: `:PluginInstall` Or `PlugInstall` for neovim apparently.
```
chsh --shell /bin/zsh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
curl -fLSs https://circle.ci/cli | DESTDIR=$HOME/bin bash
cargo install cross cargo-edit cargo-watch just
```

