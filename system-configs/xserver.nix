{
  ...
}:
{
  services.xserver = {
    enable = true;
    autoRepeatDelay = 200;
    autoRepeatInterval = 35;
    windowManager.i3.enable = true;
    layout = "pl";
    xkb.variant = "pl";
    xkb.options = "grp:alt_shift_toggle";
    videoDrivers = [
      "nvidia"
    ];
  };
}
