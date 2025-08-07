{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      ...
    }:
    let
      system = "x86_64-linux";
      username = "eien";
      hostname = "nixos";
      homedir = "/home/${username}";
      dotfiles = "${homedir}/dotflies";
      stateVersion = "25.05";
      homeStateVersion = "25.05";
    in
    {
      nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit
            inputs
            username
            hostname
            dotfiles
            stateVersion
            ;
        };
        modules = [ ./configuration.nix ];
      };

      homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        extraSpecialArgs = {
          inherit
            inputs
            username
            hostname
            dotfiles
            homeStateVersion
            ;
        };
        modules = [ ./home.nix ];
      };
    };
}
