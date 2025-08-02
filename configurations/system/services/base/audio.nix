{ config, pkgs, ... }:

{
  # Pulseaudio needs to be disabled
  services.pulseaudio.enable = false;

  environment.systemPackages = with pkgs; [ qjackctl ];

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

}
