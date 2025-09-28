{ inputs, config, lib, pkgs, ... }:

{
  #xdg.portal.extraPortals = with pkgs; [
  #  xdg-desktop-portal-hyprland
  #];

  services.displayManager = {
    defaultSession = "hyprland-uwsm";
  };

  programs.hyprland = {
    enable = true;
    withUWSM = true;
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
    # set the flake package
    #package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    # make sure to also set the portal package, so that they are in sync
    #portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-hyprland ];
    # run portal from input when using flake
    #extraPortals = with inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}; [ xdg-desktop-portal-hyprland ];
  };

  # Plugins and addons
  environment.systemPackages = with pkgs; [
    #xdg-desktop-portal-hyprland
    hyprshot # screenshotting tool
    #inputs.swww.packages.${pkgs.system}.swww # background tool
    swww
    #inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland
  ];
}
