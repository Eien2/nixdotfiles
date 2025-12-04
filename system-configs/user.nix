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
      "audio"
      "libvirtd"
    ];
    packages = with pkgs; [
      tree
    ];
  };
}
