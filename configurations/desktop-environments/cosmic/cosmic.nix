{ config, lib, pkgs, ... }:

{
  services.desktopManager.cosmic.enable = true;
  environment.sessionVariables.COSMIC_DATA_CONTROL_ENABLED = 1;

  environment.systemPackages = with pkgs; [
    xdg-desktop-portal-cosmic
  ];

  xdg.portal.extraPortals = with pkgs; [
    xdg-desktop-portal-cosmic
  ];
}
