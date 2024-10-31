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

    ../../../desktop-environments/X11.nix
    ../../../desktop-environments/awesomewm

    ../../../services/audio.nix
    ../../../services/wifi.nix

    ../../../programs/fonts.nix
    ../../../programs/gamemode.nix
    ../../../programs/steam.nix
    ../../../programs/general.nix
  ];
}
