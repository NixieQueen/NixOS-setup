{ config, lib, pkgs, ... }:

{
  programs = {
    gamescope = {
      enable = false;
      capSysNice = true;
    };
  };
}
