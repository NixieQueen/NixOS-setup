{ inputs, config, lib, pkgs, ... }:

{
  services.wlsunset = {
    enable = true;
    gamma = 1;
    latitude = 52.4;
    longitude = 4.9;
    sunset = "19:00";
    sunrise = "6:30";
    temperature = {
      day = 6500;
      night = 1200;
    };
  };
}
