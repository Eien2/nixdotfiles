{
  ...
}:
{
  home.username = "eien";
  home.homeDirectory = "/home/eien";
  home.stateVersion = "25.05";

  imports = [
    ./home-packages.nix
    ./programs/default.nix
  ];
}
