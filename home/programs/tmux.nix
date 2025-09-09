{
  pkgs,
  ...
}:
{
  programs.tmux = {
    enable = true;
    shell = "${pkgs.bash}/bin/bash";
    prefix = "C-s";
    terminal = "tmux-256color";
    mouse = true;
    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
      resurrect
      continuum
    ];
    extraConfig = ''
      bind r source-file ~/.config/tmux/tmux.conf
      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R
      bind-key C-h resize-pane -L 5
      bind-key C-j resize-pane -D 5
      bind-key C-k resize-pane -U 5
      bind-key C-l resize-pane -R 5

      set-option -g status-position top
      set -g status-bg "#191919"
      set -g status-fg "#AAAAAA"
      set -g status-right ""
      set -g status-left-length 170
      set -g status-left "[#S] "
      set -g window-status-format "#[fg=#555555] #W"
      set -g window-status-current-format "#[fg=#708090] #W"

      set -g allow-passthrough on
      set -g @resurrect-processes 'lazygit nvim snvim lf cmus'
      set -g @resurrect-capture-pane-contents 'on'
      set -g @continuum-restore 'on'
      set -g @continuum-save-interval '1'
    '';
  };
}
