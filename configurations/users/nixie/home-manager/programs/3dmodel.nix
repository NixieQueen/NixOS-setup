{ config, lib, pkgs, ... }:

{
    home.packages = with pkgs; [
      freecad-wayland
      cura-appimage
      super-slicer-latest
    ];
}
