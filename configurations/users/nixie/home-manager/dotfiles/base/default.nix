{ config, lib, pkgs, ... }:

{
  home.file.".config" = {
    recursive = true;
    source = /dot-files;
  };
  home.file."" = {
    recursive = true;
    source = /home-folder;
  };
  home.file.".Xresources" = {
    text = ''
      Xft.dpi: 96
      Xcursor.theme: Numix-cursors
      Xcursor.size: 24
    '';
  };
}
