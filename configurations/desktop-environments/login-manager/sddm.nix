{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ sddm-sugar-theme ];

  services = {
    displayManager = {
      sddm = {
        enable = true;
        theme = "sugar-candy";
      };
    };
  };
}
