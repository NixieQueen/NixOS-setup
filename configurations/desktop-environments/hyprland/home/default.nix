{ inputs, config, lib, pkgs, ... }:

# This has to be ran through the home manager
{
  wayland.windowManager.hyprland = {
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    enable = true;
    xwayland.enable = true;
    plugins = [
      #inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprpaper
    ];
    settings = {
      "$hyprpath" = "~/.config/hypr/hyprland";
      source = [
        "$hyprpath/environment-variables.conf"
        "$hyprpath/inputs.conf"
        "$hyprpath/dwindle.conf"
        "$hyprpath/keys.conf"
        "$hyprpath/monitors.conf"
        "$hyprpath/window-rules.conf"
        "$hyprpath/animations.conf"
        "$hyprpath/misc.conf"
        "$hyprpath/performance.conf"
        "$hyprpath/xwayland.conf"
        "$hyprpath/themes/nixie.conf"
      ];
    };
  };
}
