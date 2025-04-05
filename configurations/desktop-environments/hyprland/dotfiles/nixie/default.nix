{ inputs, pkgs, user, ... }:

# This has to be ran through the home manager
{
  imports = [ ./hyprland.nix ./required_apps.nix ];
  
  home.file.".config/swww" = {
    recursive = true;
    source = ./swww;
  };
}
