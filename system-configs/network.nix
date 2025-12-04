{
  ...
}:
{
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    firewall.allowedTCPPorts = [
      80
      443
    ];
  };
}
