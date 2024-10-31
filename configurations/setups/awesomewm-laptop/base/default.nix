{ config, ... }:

{
  imports = [
    ../../../system/general.nix
    ../../../system/networking.nix

    ../../../hardware/laptop

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
