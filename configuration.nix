{
  config,
  pkgs,
  hostname,
  user,
  ...
}:
{
  imports = [
    /etc/nixos/hardware-configuration.nix
  ];

  time.timeZone = "Europe/Warsaw";
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  virtualisation.libvirtd.enable = true;
  virtualisation.docker.enable = true;
  programs.virt-manager.enable = true;

  networking = {
    hostName = "${hostname}";
    networkmanager.enable = true;
    firewall.allowedTCPPorts = [
      80
      443
    ];
  };

  hardware = {
    bluetooth.enable = true;
    bluetooth.powerOnBoot = true;
    nvidia = {
      open = false;
      modesetting.enable = true;
    };
    graphics = {
      enable = true;
    };
  };

  users.users.${user} = {
    isNormalUser = true;
    extraGroups = [
      "docker"
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
  services.gvfs.enable = true;
  services.udisks2.enable = true;
  services.flatpak.enable = true;

  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
    '';
  };

  services.httpd = {
    enable = true;
    adminAddr = "oleksiak-sebastian@proton.me";
    enablePHP = true;
    virtualHosts = {
      "mywebsite.com" = {
        # forceSSL = true;
        documentRoot = "/var/www/mywebsite.com";
      };
    };
  };

  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
  };

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

  system.stateVersion = "25.05";
}
