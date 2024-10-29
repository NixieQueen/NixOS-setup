{ config, ... }:

{
  imports = [
      ../../../configurations/users/${user}/home-manager {inherit homeUsername homeDirectory;}
      ../../../configurations/users/${user}/home-manager/dotfiles {inherit configType;}
      ../../../configurations/users/${user}/home-manager/drivers

      ../../../configurations/users/${user}/home-manager/programs/general.nix
      ../../../configurations/users/${user}/home-manager/programs/git.nix
      ../../../configurations/users/${user}/home-manager/programs/gtk.nix
      ../../../configurations/users/${user}/home-manager/programs/librewolf.nix
      ../../../configurations/users/${user}/home-manager/programs/zsh.nix
  ];
}
