{ config, lib, pkgs, ... }:

{
  services.xserver = {
    displayManager = {
      #gdm.enable = false;
      #defaultSession = "none+awesome";
      #defaultSession = "hyprland";
      lightdm = {
        background = "${
        (pkgs.fetchFromGitHub {
          owner = "NixieQueen";
          repo = "awesomeWM-setup";
          rev = "177425c9904f5cf7b714a8eb8d03f8b943d44ada";
          sha256 = "8U3J9N/fYviIdZYKmoNsHppo3blc7eEBtZFJ3zRZxWM=";
        })}/themes/nixie-theme/backgrounds/MountainDragon.png";
        enable = true;
        #greeter.package = pkgs.lightdm-webkit2;
      };
    };
  };
}
