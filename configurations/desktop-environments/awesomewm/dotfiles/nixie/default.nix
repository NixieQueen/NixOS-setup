{ inputs, pkgs, user, ... }:

# This has to be ran through the home manager
{
  imports = [ ./required_apps.nix ];
  
  home.file.".config/picom" = {
    recursive = true;
    source = ./picom;
  };
}
