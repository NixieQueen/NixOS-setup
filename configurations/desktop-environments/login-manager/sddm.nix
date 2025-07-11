{ config, lib, pkgs, ... }:

{
  services = {
    displayManager = {
      sddm = {
        enable = true;
        theme = "https://framagit.org/MarianArlt/sddm-sugar-candy.git";
      };
    };
  };
}
