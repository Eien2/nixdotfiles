{
  pkgs,
  ...
}:
{
  services.flatpak.enable = true;

  xdg.portal.enable = true;
  xdg.portal.extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
  xdg.portal.config.common.default = "*";

  xdg.mime = {
    enable = true;
    defaultApplications = {
      "x-scheme-handler/roblox-player" = [ "org.vinegarhq.Sober.desktop" ];
    };
  };

  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
    '';
  };
}
