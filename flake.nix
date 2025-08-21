{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    old-nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
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
      user = "eien";
      hostname = "nixos";
      homedir = "/home/${user}";
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
            user
            hostname
            dotfiles
            stateVersion
            ;
        };
        modules = [
          ./configuration.nix
        ];
      };

      homeConfigurations.${user} = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        # TO FIX: args are not avaible in home.nix
        # extraSpecialArgs = {
        #   inherit
        #     inputs
        #     homeStateVersion
        #     user
        #     hostname
        #     dotfiles
        #     ;
        # };
        modules = [
          ./home.nix
        ];
      };
    };
}
