{
  ...
}:
{
  services.xserver = {
    enable = true;
    autoRepeatDelay = 200;
    autoRepeatInterval = 35;
    windowManager.i3.enable = true;
    xkb.layout = "pl";
    xkbVariant = "pl";
    xkb.options = "grp:alt_shift_toggle";
    videoDrivers = [
      "nvidia"
    ];
  };
}
