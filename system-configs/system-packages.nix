{
  pkgs,
  ...
}:
{
  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    xorg.xhost
    lsof
    ntfs3g
    vulkan-tools
    vulkan-loader
    glxinfo
    vulkan-validation-layers
    libglvnd
    home-manager
    neovim
    gvfs
    unzip
    picom
    polybar
    kitty
    feh
    autorandr
    vim
    wget
    lazygit
    git
    gcc
    fzf
    ripgrep
    gnumake
    python314
    go
  ];
}
