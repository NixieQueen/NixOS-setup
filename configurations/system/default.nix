{ hostnameNT, ... }:

{
  imports = [
    ./general.nix
    (import ./networking.nix {hostnameNT = hostnameNT;})
  ];
}
