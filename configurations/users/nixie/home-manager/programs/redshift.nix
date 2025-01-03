{ config, pkgs, ... }:

{
  services.redshift = {
    enable = true;
    executable = "/bin/redshift-gtk";
    brightness = {
      day = "1";
      night = "1";
    };
    temperature = {
      day = 5700;
      night = 1600;
    };
  };
}
