{ inputs, pkgs, ... }:

{
  imports = [ ../login-manager/gdm.nix ../Wayland.nix ];
}
