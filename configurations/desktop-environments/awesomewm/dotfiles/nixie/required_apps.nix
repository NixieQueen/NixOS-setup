{ inputs, pkgs, ... }:

{
  imports = [ ./redshift.nix ];
  
  home.packages = with pkgs; [
    picom-ft-labs
  ];
}
