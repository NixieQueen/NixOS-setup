{ config, lib, pkgs, ... }:

{
  # environment.systemPackages = with pkgs; [
  #   xdg-desktop-portal-gtk
  # ];



  services.xserver = {
    enable = true;
    xkb.layout = "us";
  };
}
