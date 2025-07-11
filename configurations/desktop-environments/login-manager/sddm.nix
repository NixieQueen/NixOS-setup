{ config, lib, pkgs, ... }:

{
  services = {
    displayManager = {
      sddm = {
        enable = true;
        theme = pkgs.sddm-sugar-theme;
      };
    };
  };
}
