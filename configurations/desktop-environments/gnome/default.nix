{ config, lib, pkgs, ... }:

{
  services.xserver = {
    desktopManager = {
      gnome.enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    xdg-desktop-portal-gtk
  ];

  xdg.portal.extraPortals = with pkgs; [
    xdg-desktop-portal-gtk
  ];
}
