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
}
