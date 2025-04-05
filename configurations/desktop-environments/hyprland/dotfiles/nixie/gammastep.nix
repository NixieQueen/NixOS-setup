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
        temp-day = lib.mkForce 6500;
        temp-night = lib.mkForce 1200;
        fade = 1;
      };
    };
  };
}
