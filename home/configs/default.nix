{ config, ... }:
let
  dotfiles = "${config.home.homeDirectory}/dotfiles/home/configs/";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
in
{
  imports = [
    ./bash.nix
    ./fastfetch.nix
    ./lf.nix
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

  xdg.configFile."kitty" = {
    source = create_symlink "${dotfiles}/kitty/";
    recursive = true;
  };

  xdg.configFile."polybar" = {
    source = create_symlink "${dotfiles}/polybar/";
    recursive = true;
  };

  xdg.configFile."picom" = {
    source = create_symlink "${dotfiles}/picom/";
    recursive = true;
  };
}
