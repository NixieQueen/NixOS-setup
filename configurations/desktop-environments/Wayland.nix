{ config, lib, pkgs, ... }:

{
  # environment.systemPackages = with pkgs; [
  #   xdg-desktop-portal-hyprland
  # ];

  environment.sessionVariables = {
    #XDG_CURRENT_DESKTOP = "Hyprland";
    #XDG_SESSION_DESKTOP = "Hyprland";
    #XDG_SESSION_TYPE = "wayland";
    #GDK_BACKEND = "wayland";
    #GTK_USE_PORTAL = "1";
    #QT_QPA_PLATFORMTHEME = "qt5ct";
    #QT_QPA_PLATFORM = "wayland";
    #QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    #QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    #MOZ_ENABLE_WAYLAND = "1";
  };

  services.xserver = {
    enable = true;
    xkb.layout = "us";
  };
}
