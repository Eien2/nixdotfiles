{
  ...
}:
{
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
}
