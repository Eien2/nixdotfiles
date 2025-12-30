{
  pkgs,
  ...
}:
{
  users.users.eien = {
    isNormalUser = true;
    extraGroups = [
      "docker"
      "wheel"
      "video"
      "audio"
      "libvirtd"
    ];
    packages = with pkgs; [
      tree
    ];
  };

  users.users.robloxalt = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "video"
      "audio"
    ];
  };
}
