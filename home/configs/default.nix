{ config, ... }:
let
  dotfiles = "${config.home.homeDirectory}/dotfiles/home/configs/external";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
in
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

  xdg.configFile."i3" = {
    source = create_symlink "${dotfiles}/i3/";
    recursive = true;
  };

  xdg.configFile."nvim" = {
    source = create_symlink "${dotfiles}/nvim/";
    recursive = true;
  };
}
