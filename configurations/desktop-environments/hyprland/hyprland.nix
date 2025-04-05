{ inputs, config, lib, pkgs, ... }:

# This has to be ran through the home manager
{
  nix.settings = {
    trusted-substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

  xdg.portal.extraPortals = with pkgs; [
    #xdg-desktop-portal-hyprland
  ];

  services.displayManager = {
    defaultSession = "hyprland";
  };

  programs.hyprland = {
    enable = true;
    # set the flake package
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    # make sure to also set the portal package, so that they are in sync
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

  # Plugins and addons
  environment.systemPackages = with pkgs; [
    #xdg-desktop-portal-hyprland
    hyprshot # screenshotting tool
    inputs.swww.packages.${pkgs.system}.swww # background tool
    inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland
  ];
}
