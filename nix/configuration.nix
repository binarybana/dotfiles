# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      <home-manager/nixos> 
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.useOSProber = true;

  #boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "alderwhale"; # Define your hostname.

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  networking.useDHCP = false;
  networking.interfaces.enp4s0.useDHCP = true;

  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  
  services.xserver.xkbVariant = "dvorak";
  console.useXkbConfig = true;

  # Enable sound.
  sound.enable = true;
  hardware = {
    pulseaudio = {
      enable = true;
      support32Bit = true;
      package = pkgs.pulseaudioFull;
    };
  };
 
  nix = {
    package = pkgs.nixUnstable;
    extraOptions = ''
      keep-outputs = true
      keep-derivations = true
      experimental-features = nix-command flakes
    '';
   };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jason = {
    isNormalUser = true;
    extraGroups = [ "docker" "wheel" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.fish;
    hashedPassword = "$6$VWvcLSeNXUyMQyhD$YRFTOT8AQkVwKc/sFJ3FWOBZSPyf0rAv7LtnO06IoJkFhnyQguVQH6pVoh22plAQijk15eRNzla3nRuu4Ns87";
  };

  nixpkgs.config.allowUnfree = true;
  home-manager.users.jason = import ./home.nix;

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.opengl.enable = true;

  services.xserver.monitorSection = ''
    Modeline "3840x2160_120.00"  1498.25  3840 4192 4616 5392  2160 2163 2168 2316 -hsync +vsync
  '';
  
  virtualisation.docker.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    rustup
    clang_13
    openssl
    docker
    docker-buildx
    git
    config.boot.kernelPackages.perf
    # config.boot.kernelPackages.bpftrace
    # mullvad-vpn
  ];


  services.openssh.enable = true;
  services.mullvad-vpn.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.11"; # Did you read the comment?

}

