{ inputs, pkgs, ... }:

{
  imports = [ ../login-manager/sddm.nix ../Wayland.nix ];
}
