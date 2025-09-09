{
  ...
}:
{
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
