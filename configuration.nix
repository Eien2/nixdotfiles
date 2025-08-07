{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
let
  # home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-25.05.tar.gz";
in
{
  imports = [
    /etc/nixos/hardware-configuration.nix
    # (import "${home-manager}/nixos")
  ];

  time.timeZone = "Europe/Warsaw";
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    backupFileExtension = "backup";
    users.eien = import ./home.nix;
  };

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };

  hardware = {
    bluetooth.enable = true;
    bluetooth.powerOnBoot = true;
    nvidia.open = false;
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        nvidia-container-toolkit
        vulkan-loader
      ];
    };
  };

  users.users.eien = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "audio"
    ];
    packages = with pkgs; [
      tree
    ];
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
  };
  services.flatpak.enable = true;
  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
    '';
  };
  services.blueman.enable = true;
  services.pulseaudio.enable = true;
  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = true;
  };
  services.pipewire = {
    enable = false;
    pulse.enable = true;
  };
  services.xserver = {
    enable = true;
    videoDrivers = [
      "nvidia"
    ];
    xkb.layout = "us";
    xkb.options = "eurosign:e";
    windowManager.i3 = {
      enable = true;
      configFile = "/home/eien/dotfiles/i3/config";
      extraPackages = with pkgs; [
        i3lock
      ];
    };
  };
  services.gvfs.enable = true;
  services.udisks2.enable = true;

  fonts.packages = with pkgs; [
    dejavu_fonts
    nerd-fonts.cousine
    nerd-fonts.symbols-only
    ipafont
    kochi-substitute
  ];

  i18n.defaultLocale = "en_US.UTF-8";

  programs.firefox.enable = true;
  programs.i3lock.enable = true;
  programs.dconf = {
    enable = true;
    packages = with pkgs; [ ibus ];
  };

  nixpkgs = {
    config.pulseaudio = true;
    config.allowUnfree = true;
  };

  environment.systemPackages = with pkgs; [
    # home-manager
    libmtp
    gvfs
    xclip
    fastfetch
    unzip
    lf
    picom
    polybar
    tmux
    kitty
    rofi
    feh
    stow
    autorandr
    vim
    wget
    neovim
    lazygit
    git
    gcc
    fzf
    ripgrep
    gnumake
    python314
    go
    lua-language-server
    stylua
    vscode-langservers-extracted
    typescript-language-server
    vim-language-server
    tailwindcss-language-server
    prettierd
    black
    bash-language-server
    eslint_d
    pylint
    vscode-extensions.denoland.vscode-deno
    nixd
    nixfmt-rfc-style
    isort
    pretty-php
    marksman
    emmet-language-server
    pyright
  ];

  system.stateVersion = "25.05";
}
