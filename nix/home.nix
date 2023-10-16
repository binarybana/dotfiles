{ config, lib, pkgs, ... }:

{
  programs.home-manager.enable = true;
  
  home.username = "jason";
  home.homeDirectory = "/home/jason";
  nixpkgs.config.allowUnfree = true;

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
  home.enableNixpkgsReleaseCheck = true;


  home.packages = [
    pkgs.tmux
    pkgs.bat
    pkgs.fd
    pkgs.exa
    pkgs.fzf
    pkgs.htop
    pkgs.jq
    pkgs.ripgrep
    pkgs.tree
    pkgs.watch
    pkgs.starship
    pkgs.pstree
    pkgs.vscode
    pkgs.google-chrome
    pkgs.spotify
    pkgs.firefox
    pkgs.gnome.gnome-tweaks
    pkgs.hub
    # pkgs.bpftools
    pkgs.file
    pkgs.discord
    pkgs.slack
    pkgs.nixpkgs-fmt
    pkgs.xclip
  ];

  xdg.configFile."starship.toml".source = ../home/.config/starship.toml;
  xdg.configFile."flake8".source = ../home/.config/flake8;
  xdg.configFile."nix.conf".source = ../home/.config/nix.conf;
  xdg.configFile."Code/User/settings.json".source = ../settings.json;

  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      vim-nix
      tcomment_vim
      molokai
      vim-airline
      nerdtree
      vim-rooter
    ];
    extraConfig = (builtins.readFile ../home/.config/nvim/init.vim);
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = lib.strings.concatStrings (lib.strings.intersperse "\n" [
      (builtins.readFile ../home/.config/fish/config.fish)
      "set -g SHELL ${pkgs.fish}/bin/fish"
    ]);
  };

  programs.tmux = {
    enable = true;
    terminal = "xterm-256color";
    secureSocket = false;
    extraConfig = (builtins.readFile ../home/.tmux.conf);
  };

  programs.alacritty = {
    enable = true;
    settings = {
      env.TERM = "xterm-256color";
    };
  };

  programs.git = {
    userName = "Jason Knight";
    userEmail = "binarybana@gmail.com";
    aliases= {
      adog = "log --all --decorate --oneline --graph";
    };
    extraConfig = {
      color = {
        ui = "auto";
      };
      diff = {
        tool = "nvim -d";
        mnemonicprefix = true;
      };
      merge = {
        tool = "splice";
      };
      push = {
        default = "simple";
      };
      pull = {
        rebase = true;
      };
    };
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";
}
