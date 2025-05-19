{ config, pkgs, ... }:

{
  # Enable bluetooth
  hardware.bluetooth = {
    enable = false;
    hsphfpd.enable = false;
    settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
      };
    };
  };

  services = {
    blueman.enable = true;
  };
}
