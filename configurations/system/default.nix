{ hostnameNT, ... }:

{
  imports = [
    /general.nix
    /networking.nix ({hostnameNT = hostnameNT;})
  ];
}
