{ config, pkgs, ... }:
let
  user = "nixie";
in
{
  home.username = user;
  home.homeDirectory = "/home/" + user;

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;

  imports = [ ./dotfiles ./drivers ./programs ];
}
