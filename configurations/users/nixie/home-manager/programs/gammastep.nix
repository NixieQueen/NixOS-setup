{ config, lib, pkgs, ... }:

{
  services.gammastep = {
    enable = true;
    provider = "manual";
    dawnTime = "8:00-10:45";
    duskTime = "16:35-19:15";
    tray = true;
    settings = {
      general = {
        temp-day = 6500;
        temp-night = 1300;
        fade = 1;
      };
    };
  };
}
