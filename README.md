# Jason Dotfiles 

First make sure you have Git worthy ssh creds. Then
```
# Install Homeshick
git clone https://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
printf '\nsource $HOME/.homesick/repos/homeshick/homeshick.sh\n' >> $HOME/.bashrc
source $HOME/.bashrc
homeshick clone git@github.com:binarybana/dotfiles.git
homeshick cd dotfiles
./install.sh
```
Open neovim: :PlugInstall .

# Optional
```
# Rustup 
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```
