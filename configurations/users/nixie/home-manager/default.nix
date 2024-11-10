{ config, pkgs, user, ... }:

{
  home.username = user;
  home.homeDirectory = "/home/" + user;

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
