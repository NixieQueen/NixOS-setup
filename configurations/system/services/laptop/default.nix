{ config, pkgs, ... }:

{
  imports = [
    ./bluetooth.nix
    ./fwupd.nix
    ./thermald.nix
    ./tlp-laptop.nix
    ./wifi.nix
  ];
}
