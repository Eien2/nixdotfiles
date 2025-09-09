{
  ...
}:
{
  home.username = "eien";
  home.homeDirectory = "/home/eien";
  home.stateVersion = "25.05";

  imports = [
    ./packages/default.nix
    ./configs/default.nix
  ];
}
