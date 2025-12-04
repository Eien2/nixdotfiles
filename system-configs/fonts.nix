{
  pkgs,
  ...
}:
{
  fonts.packages = with pkgs; [
    dejavu_fonts
    nerd-fonts.cousine
    nerd-fonts.symbols-only
    ipafont
    kochi-substitute
  ];
}
