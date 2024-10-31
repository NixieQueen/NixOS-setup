{ config, lib, pkgs, ... }:

{
  home.file.".config" = {
    recursive = true;
    source = ./dot-files;
  };
  home.file."" = {
    recursive = true;
    source = ./home-folder;
  };
  home.file.".Xresources" = {
    text = ''
      Xft.dpi: 96
      Xcursor.theme: Numix-cursors
      Xcursor.size: 24
    '';
  };
  home.file.".config/awesome" = {
    source = builtins.fetchGit {
      url = "https://github.com/NixieQueen/awesomeWM-setup.git";
      rev = "6ed2696b2fa1dca76a9ae847d44de064c03afb13";
      #allRefs = true;
    };
  };
}
