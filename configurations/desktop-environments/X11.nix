{ config, lib, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    xkb.layout = "us";
  };
}
