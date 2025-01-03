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
    ../../../desktop-environments/cosmic

    ../../../services/audio.nix
    ../../../services/wifi.nix
    #../../../services/tlp-laptop.nix
    ../../../services/thermald.nix
    ../../../services/upower.nix
    # ../../../services/samba.nix
    # ../../../services/printing.nix

    ../../../programs/fonts.nix
    #../../../programs/gamemode.nix
    #../../../programs/gamescope.nix
    ../../../programs/steam.nix
    #../../../programs/fwupd.nix
    ../../../programs/general.nix
  ];
}
