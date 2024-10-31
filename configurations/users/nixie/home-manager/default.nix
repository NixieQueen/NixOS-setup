{ config, pkgs, ... }:

{
  home.username = "nixie";
  home.homeDirectory = "/home/nixie";

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
