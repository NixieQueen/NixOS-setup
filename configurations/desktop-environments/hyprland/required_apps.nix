{ inputs, pkgs, ... }:

{
  imports = [ ../login-manager/lightdm.nix ../Wayland.nix ];
}
