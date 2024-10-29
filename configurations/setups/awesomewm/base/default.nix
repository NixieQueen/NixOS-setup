{ config, ... }:

{
  imports = [
    ../../../system
    ../../../hardware
    ../../../users/${config.user}/${config.user}.nix
    ../../../drivers
    ../../../desktop-environments
    ../../../desktop-environments/awesomewm

    ../../../services/audio.nix
    ../../../services/wifi.nix

    ../../../programs/fonts.nix
    ../../../programs/gamemode.nix
    ../../../programs/steam.nix
    ../../../programs/general.nix
  ];
}
