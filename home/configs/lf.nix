{
  ...
}:
{
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
}
