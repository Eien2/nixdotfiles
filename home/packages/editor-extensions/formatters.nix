{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    stylua
    prettierd
    black
    nixfmt-rfc-style
    isort
    pretty-php
  ];
}
