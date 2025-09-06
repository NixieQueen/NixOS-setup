{ config, inputs, pkgs, ... }:

{
  imports = [
    ./general.nix
    ./3dmodel.nix
    ./git.nix
    ./gtk.nix
    ./librewolf.nix
    ./minecraft.nix
    ./spotify.nix
    ./zsh.nix
    ./blender.nix
    ./ssh.nix
    ./chemistry.nix
  ];
}
