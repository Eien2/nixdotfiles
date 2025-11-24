{
  ...
}:
{
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
      nrsf = "sudo nixos-rebuild switch --flake ~/dotfiles#nixos --impure";
    };

    initExtra = ''
      PS1='\n\[\e[38;2;216;45;52m\]\u\[\e[38;2;253;246;212m\][\[\e[38;2;252;120;41m\]\w\[\e[38;2;253;246;212m\]]\[\e[0m\]' 
      export DOT=/home/eien/dotfiles
      export DISPLAY=:0.0
      export MONITOR=DVI-D-0
      export EDITOR=neovim
      export TERM=xterm-kitty
      export PATH="$HOME/bin:$PATH"
    '';
  };
}
