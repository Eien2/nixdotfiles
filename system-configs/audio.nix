{
  ...
}:
{
  services.pulseaudio.enable = true;

  services.pipewire = {
    enable = false;
    pulse.enable = true;
  };

  nixpkgs = {
    config.pulseaudio = true;
  };
}
