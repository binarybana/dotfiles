{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-21.11";
  outputs = { self, nixpkgs }: {
    nixosConfigurations.container = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ ./configuration.nix ]
    };
  };
}
