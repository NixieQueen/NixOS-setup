{ computerType, ... }:

{
  imports = [
    ./bootloader
    ./drivers
    ./hardware/${computerType}
    ./programs
    ./services

    ./general.nix
    ./networking.nix
    ./nix-settings.nix
  ];
}
