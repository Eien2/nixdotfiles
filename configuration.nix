{
  pkgs,
  ...
}:
{
  imports = [
    /etc/nixos/hardware-configuration.nix
    ./system-configs/default.nix
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  services.gvfs.enable = true;
  services.udisks2.enable = true;

  programs.dconf = {
    enable = true;
    packages = [ pkgs.ibus ];
  };

  nixpkgs = {
    config.allowUnfree = true;
  };

  system.stateVersion = "25.05";
}
