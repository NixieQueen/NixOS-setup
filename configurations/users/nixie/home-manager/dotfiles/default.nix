{ config, lib, pkgs, ... }:

{
  home.file.".config" = {
    recursive = true;
    source = ./dot-config;
  };
  home.file.".p10k.zsh" = {
    recursive = true;
    source = ./home-folder/.p10k.zsh;
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
      rev = "0730171a7bcd9bdfb85833b95e22bb861ce92594";
      #allRefs = true;
    };
  };
}
