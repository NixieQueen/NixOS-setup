{ config, lib, pkgs, inputs, ... }:

{
  imports = [ ./substituters.nix ./picom-ft-labs.nix ./lua-pam.nix ];
  
  nixpkgs.overlays = [
    inputs.nixpkgs-f2k.overlays.window-managers
    inputs.qchem.overlays.qchem
  ];
}
