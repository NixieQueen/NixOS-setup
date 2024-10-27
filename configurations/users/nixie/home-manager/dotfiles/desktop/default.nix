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
}
