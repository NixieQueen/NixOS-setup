{ config, lib, pkgs, ... }:

{
  services.gammastep = {
    enable = true;
    provider = "manual";
    dawnTime = "8:00-10:45";
    duskTime = "19:35-23:15";
    tray = true;
    settings = {
      general = {
        temp-day = lib.mkForce 6500;
        temp-night = lib.mkForce 1000;
        fade = 1;
      };
    };
  };
}
