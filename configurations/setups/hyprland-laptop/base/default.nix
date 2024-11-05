{ config, ... }:

let
    user = "nixie";
in
{
  imports = [
    ../../../system/general.nix
    ../../../system/networking.nix

    ../../../hardware/laptop

    ../../../users/${user}/${user}.nix

    ../../../drivers/base
    ../../../drivers/laptop

    ../../../desktop-environments/Wayland.nix
    ../../../desktop-environments/hyprland/base

    ../../../services/audio.nix
    ../../../services/wifi.nix
    ../../../services/tlp-laptop.nix
    ../../../services/thermald.nix
    ../../../services/upower.nix

    ../../../programs/fonts.nix
    ../../../programs/gamemode.nix
    ../../../programs/gamescope.nix
    ../../../programs/steam.nix
    ../../../programs/general.nix
  ];
}
