{ inputs, pkgs, user, ... }:

# This has to be ran through the home manager
{
  imports = [ ./niri.nix ./required_apps.nix ];
}
