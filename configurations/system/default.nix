{ hostnameNT, pkgs, ... }:

{
  imports = [
    ./general.nix
    (import ./networking.nix {hostnameNT = hostnameNT;})
  ];
}
