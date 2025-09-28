{
  ...
}:
{
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
    theme = "/home/eien/dotfiles/home/configs/rofi/lackluster.rasi";
  };
}
