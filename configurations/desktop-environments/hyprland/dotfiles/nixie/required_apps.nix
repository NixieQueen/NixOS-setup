{ inputs, pkgs, ... }:

{
  imports = [ ./gammastep.nix ];
  
  home.packages = with pkgs; [
    inputs.ignis.packages.${system}.ignis
  ];
}
