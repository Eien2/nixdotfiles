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
      nrsf = "sudo nixos-rebuild switch --flake ~/dotfiles#nixos";
    };

    initExtra = ''
      PS1='\n\[\e[38;5;234m\]\u\[\e[38;5;243;1m\][\[\e[22m\]\w\[\e[1m\]]\[\e[0m\]'
      export DOT=/home/eien/dotfiles
      export DISPLAY=:0.0
      export MONITOR=DVI-D-1
      export EDITOR=neovim
      export PATH="$HOME/bin:$PATH"
    '';
  };
}
