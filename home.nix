{
  config,
  pkgs,
  ...
}:
{
  home.username = "eien";
  home.homeDirectory = "/home/eien";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    xclip
    rofi
    tmux
    lf
    fastfetch
    stow
    blueberry
    flatpak
    lazygit
    nautilus
    cmus
    gimp
    cava
    flameshot
    killall
    chafa
    bat
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

  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      e = "sudo shutdown now";
      stowit = "stow -v -R -t ~";
      unstowit = "stow -v -R -D -t ~";
      tma = "tmux attach-session";
      snvim = "sudo --preserve-env nvim";
      ls = "ls --color=auto";
      lg = "lazygit";
      grep = "grep --color=auto";
      nrs = "sudo nixos-rebuild switch";
    };

    initExtra = ''
      PS1='\n\[\e[38;5;245m\]\u\[\e[38;5;253;1m\][\[\e[22m\]\w\[\e[1m\]]\[\e[0m\]'
      export DOT=/home/eien/dotfiles
      export DISPLAY=:0.0
      export MONITOR=DVI-D-1
      export EDITOR=neovim
      export PATH="$HOME/bin:$PATH"
    '';
  };

  programs.tmux = {
    enable = true;
    shell = "${pkgs.bash}/bin/bash";
    prefix = "C-s";
    terminal = "tmux-256color";
    mouse = true;
    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
      resurrect
      continuum
    ];
    extraConfig = ''
      bind r source-file ~/.config/tmux/tmux.conf
      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R
      bind-key C-h resize-pane -L 5
      bind-key C-j resize-pane -D 5
      bind-key C-k resize-pane -U 5
      bind-key C-l resize-pane -R 5

      set-option -g status-position top
      set -g status-bg "#191919"
      set -g status-fg "#AAAAAA"
      set -g status-right ""
      set -g status-left-length 170
      set -g status-left "[#S] "
      set -g window-status-format "#[fg=#555555] #W"
      set -g window-status-current-format "#[fg=#708090] #W"

      set -g allow-passthrough on
      set -g @resurrect-processes 'lazygit nvim snvim lf cmus'
      set -g @resurrect-capture-pane-contents 'on'
      set -g @continuum-restore 'on'
      set -g @continuum-save-interval '1'
    '';
  };

  programs.kitty = {
    enable = true;
    font.name = "CousineNerdFont";
    font.size = 12.0;
    extraConfig = ''
      enable_audio_bell no
      window_alert_on_bell no

      background #101010
      foreground #DDDDDD
      cursor     #DDDDDD

      color0  #2A2A2A
      color1  #D70000
      color2  #899989
      color3  #7A7A7A
      color4  #555555
      color5  #AAAAAA
      color6  #708090
      color7  #DDDDDD

      color8  #3F3F3F
      color9  #FF3232
      color10 #B7CCB7
      color11 #A5A5A5
      color12 #6B6B6B
      color13 #CCCCCC
      color14 #95AABF
      color15 #FFF9F9

      selection_background #303030
      selection_foreground #E5E9F0
      url_color #96A9D9

      window_padding_width 0 8
    '';
  };

  programs.lf = {
    enable = true;
    settings = {
      shell = "sh";
      shellopts = "-eu";
      ifs = "\n";
      scrolloff = 10;
      cursorpreviewfmt = "\033[7;2m";
      hidden = true;
      ignorecase = true;
      icons = false;
      preview = true;
      drawbox = false;
    };
    keybindings = {
      e = "$nvim '$f'";
      y = "copy";
      x = "cut";
      v = "toggle";
      V = "glob-select *";
      p = "paste";
      ad = "mkdir";
      dd = "delete";

      gp = "cd ~/projects";
      gd = "cd ~/dotfiles";
      gc = "cd ~/.config";
      gC = "cd ~/courses";
      gi = "cd ~/images";
      gw = "cd ~/images/wallpapers";
      gn = "cd ~/notes";
      gx = "cd /opt/lampp/htdocs";
      gv = "cd ~/videos";
      gm = "cd ~/music";
    };
  };

  programs.rofi = {
    enable = true;
    modes = [
      "window"
      "run"
      "drun"
      "combi"
    ];
    font = "Cousine Nerd Font 12";
    extraConfig = {
      drun-display-format = "{name}";
    };
    theme = "/home/eien/.config/rofi/lackluster.rasi";
  };

  programs.fastfetch = {
    enable = true;
    settings = {
      modules = [
        "title"
        "separator"
        "os"
        "kernel"
        "uptime"
        "packages"
        "shell"
        "wm"
        "font"
        "player"
        "break"
        "editor"
        "terminal"
        "terminalfont"
        "cpu"
        "gpu"
        "memory"
        "disk"
        "break"
        "colors"
      ];
      display = {
        color = {
          keys = "blue";
          title = "blue";
        };
      };
      logo = {
        source = "/home/eien/dotfiles/fastfetch/.config/fastfetch/just-listen-to-the-song-neofetch.png";
        width = 40;
        height = 19;
        padding = {
          top = 0;
          left = 0;
          right = 2;
        };
      };
      image = {
        backend = "chafa";
      };
    };
  };

  programs.neovim = {
    enable = true;
  };

  services.picom = {
    enable = true;
    vSync = true;
    fade = true;
    fadeDelta = 10;
    activeOpacity = 1;
    inactiveOpacity = 1;
    backend = "glx";
    opacityRules = [
      "70:class_g = 'kitty' && focused"
      "70:class_g = 'kitty' && !focused"
    ];
    settings = {
      # "rounded-borders" = 1;
      # "corner-radius" = 12;
      # "rounded-corners-exclude" = [
      #   "class_g = 'Polybar'"
      #   "class_g = 'Rofi'"
      # ];
      blur = {
        background = true;
        method = "dual_kawase";
        strength = 3;
        "background-exclude" = [
          "window_type = 'dock'"
        ];
      };
    };
  };

  services.polybar = {
    enable = true;
    config = {
      "colors" = {
        background = "#2A2A2A";
        background-alt = "#789978";
        primary = "#CCCCCC";
        secondary = "#7A7A7A";
        alert = "#FFAA88";
        disabled = "#191919";
      };

      "bar/main" = {
        monitor = "\${env:MONITOR}";
        width = "100%";
        height = "22pt";
        background = "\${colors.background}";
        foreground = "\${colors.primary}";
        padding-left = 1;
        padding-right = 1;
        module-margin = 1;
        font-0 = "Cousine nerd font:size=11;2";
        modules-left = "xworkspaces";
        modules-center = "date";
        modules-right = "pulseaudio";
        cursor-click = "pointer";
        cursor-scroll = "ns-resize";
        enable-ipc = true;
        monitor-fallback = "DVI-D-1";
        override-redirect = false;
      };

      "settings" = {
        screenchange-reload = true;
        pseudo-transparency = true;
      };
    };
    settings = {
      "module/systray" = {
        type = "internal/tray";
        format-margin = "8pt";
        tray-spacing = "16pt";
      };

      "module/xworkspaces" = {
        type = "internal/xworkspaces";
        label-active = "%name%";
        label-active-background = "\${colors.primary}";
        label-active-foreground = "\${colors.background}";
        label-active-padding = 1;
        label-occupied = "%name%";
        label-occupied-padding = 1;
        label-urgent = "%name%";
        label-urgent-background = "\${colors.alert}";
        label-urgent-padding = 1;
        label-empty = "%name%";
        label-empty-foreground = "\${colors.primary}";
        label-empty-padding = 1;
      };

      "module/pulseaudio" = {
        type = "internal/pulseaudio";
        format-volume-prefix = "󰕾 ";
        format-volume-prefix-foreground = "\${colors.secondary}";
        format-volume = "<label-volume>";
        label-volume = "%percentage%%";
        label-muted = "󰖁";
        label-muted-foreground = "\${colors.alert}";
      };

      "module/xkeyboard" = {
        type = "internal/xkeyboard";
        label-layout = "%layout%";
        label-layout-foreground = "\${colors.primary}";
        label-indicator-padding = 2;
        label-indicator-foreground = "\${colors.background}";
        label-indicator-background = "\${colors.primary}";
      };

      "network-base" = {
        type = "internal/network";
        interval = 5;
        format-connected = "<label-connected>";
        format-disconnected = "<label-disconnected>";
        label-disconnected = "%{F#FFAA88}disconnected";
      };

      "module/eth" = {
        "inherit" = "network-base";
        interface-type = "wired";
        label-connected = "%{F#7A7A7A}%ifname%%{F-} %local_ip%";
      };

      "module/date" = {
        type = "internal/date";
        interval = 1;
        date = "%H:%M:%S - %A %d of %B";
        date-alt = "%H:%M:%S";
        label = "%date%";
        label-foreground = "#95AABF";
      };
    };
    script = "";
  };
}
