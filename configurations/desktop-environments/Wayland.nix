{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    xdg-desktop-portal-hyprland
  ];

  services.xserver = {
    enable = true;
    xkb.layout = "us";
  };
}
