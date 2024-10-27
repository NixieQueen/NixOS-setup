{ config, pkgs, ... }:

{
  programs = {
    git = {
      enable = true;
      userName = "NixieQueen";
      userEmail = "thestampyliker@gmail.com";
    };
  };
}
