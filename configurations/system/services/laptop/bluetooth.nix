{ config, pkgs, ... }:

{
  # Enable bluetooth
  hardware.bluetooth = {
    powerOnBoot = false;
    enable = true;
    hsphfpd.enable = false;
    settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
        Experimental = true;
      };
    };
  };

  services = {
    blueman.enable = true;
  };
}
