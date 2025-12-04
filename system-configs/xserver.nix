{
  ...
}:
{
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
}
