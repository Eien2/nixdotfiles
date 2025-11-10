{
  config,
  pkgs,
  hostname,
  user,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
  ];

  time.timeZone = "Europe/Warsaw";
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  networking = {
    hostName = "${hostname}";
    networkmanager.enable = true;
  };

  hardware = {
    bluetooth.enable = true;
    bluetooth.powerOnBoot = true;
    nvidia = {
      open = false;
      modesetting.enable = true;
    };
    opengl = {
      enable = true;
    };
    graphics = {
      enable = true;
    };
  };

  users.users.${user} = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "audio"
      "libvirtd"
    ];
    packages = with pkgs; [
      tree
    ];
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
    autoRepeatDelay = 200;
    autoRepeatInterval = 35;
    windowManager.i3.enable = true;
    xkb.layout = "us";
    xkb.options = "eurosign:e";
    videoDrivers = [
      "nvidia"
    ];
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
  programs.dconf = {
    enable = true;
    packages = [ pkgs.ibus ];
  };

  nixpkgs = {
    config.pulseaudio = true;
    config.allowUnfree = true;
  };

  environment.systemPackages = with pkgs; [
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

  system.stateVersion = "25.05";
}
