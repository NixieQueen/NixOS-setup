{ config, ... }:

let
      user = "nixie";
in
{
  imports = [
      ../../../users/${user}/home-manager

      ../../../users/${user}/home-manager/dotfiles
      ../../../users/${user}/home-manager/drivers

      ../../../users/${user}/home-manager/programs/general.nix
      ../../../users/${user}/home-manager/programs/git.nix
      ../../../users/${user}/home-manager/programs/gtk.nix
      ../../../users/${user}/home-manager/programs/librewolf.nix
      ../../../users/${user}/home-manager/programs/zsh.nix
      ../../../users/${user}/home-manager/programs/redshift.nix
  ];
}
