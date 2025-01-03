{ pkgs, config, user, ... }:

{
  imports = [
      ../../../users/${user}/home-manager
      ../../../desktop-environments/hyprland/home

      ../../../users/${user}/home-manager/dotfiles
      ../../../users/${user}/home-manager/drivers

      ../../../users/${user}/home-manager/programs/general.nix
      ../../../users/${user}/home-manager/programs/git.nix
      ../../../users/${user}/home-manager/programs/gtk.nix
      ../../../users/${user}/home-manager/programs/librewolf.nix
      ../../../users/${user}/home-manager/programs/zsh.nix
      ../../../users/${user}/home-manager/programs/spotify.nix
      ../../../users/${user}/home-manager/programs/gammastep.nix
      ../../../users/${user}/home-manager/programs/minecraft.nix
  ];
}
