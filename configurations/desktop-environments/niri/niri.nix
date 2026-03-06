{ config, lib, pkgs, ... }:

{
  programs.niri.enable = true;

  programs.xwayland.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ 
	xdg-desktop-portal-gnome
	#xdg-desktop-portal-hyprland
    ];
    # run portal from input when using flake
    #extraPortals = with inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}>
  };

  #services.displayManager = {
  #  defaultSession = "niri";
  #};
  
  # Fix weird security problems with swaylock
  security.pam.services.swaylock-plugin = {};
  #
  environment.systemPackages = with pkgs; [
    #xdg-desktop-portal-hyprland
    #hyprshot # screenshotting tool
    #inputs.swww.packages.${pkgs.system}.swww # background tool
    #libsForQt5.xwaylandvideobridge
    swww
    xwayland-satellite
    #inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal->
  ];
}
