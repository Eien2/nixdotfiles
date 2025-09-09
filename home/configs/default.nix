{
  ...
}:
{
  imports = [
    ./bash.nix
    ./polybar.nix
    ./fastfetch.nix
    ./kitty.nix
    ./lf.nix
    ./picom.nix
    ./rofi.nix
    ./tmux.nix
  ];

  home.file.".config/i3".source = ./external/i3;
  home.file.".config/nvim".source = ./external/nvim;
}
