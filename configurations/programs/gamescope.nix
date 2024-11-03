{ config, lib, pkgs, ... }:

{
  programs = {
    gamescope = {
      enable = true;
      capSysNice = true;
    };
  };
}
