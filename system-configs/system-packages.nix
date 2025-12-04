{
  pkgs,
  ...
}:
{
  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
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
    python3Packages.pip
    python3Packages.gdata
    go
  ];
}
