{ config, ... }:

let
      user = "nixie";
in
{
  imports = [
      ../../../configurations/users/${user}/${user}.nix
      ../../../configurations/users/${user}/home-manager

      ../../../configurations/users/${user}/home-manager/dotfiles/base
      ../../../configurations/users/${user}/home-manager/dotfiles/laptop

      ../../../configurations/users/${user}/home-manager/drivers

      ../../../configurations/users/${user}/home-manager/programs/general.nix
      ../../../configurations/users/${user}/home-manager/programs/git.nix
      ../../../configurations/users/${user}/home-manager/programs/gtk.nix
      ../../../configurations/users/${user}/home-manager/programs/librewolf.nix
      ../../../configurations/users/${user}/home-manager/programs/zsh.nix
  ];
}
