{
  ...
}:
{
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
    };
  };
}
