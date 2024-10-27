{ config, pkgs, homeUsername, homeDirectory, ... }:

{
  home.username = homeUsername;
  home.homeDirectory = homeDirectory;

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
