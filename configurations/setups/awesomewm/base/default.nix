{ configType ? "laptop" , hostname ? "nixieFramework", user, ... }:

{
  import = [
    (import ../../../system {hostnameNT = hostname;})
    (import ../../../hardware {configType = configType;})
    ../../../users/${user}/${user}.nix
    (import ../../../drivers {configType = configType;})
    (import ../../../desktop-environments {useWayland = false;})
    ../../../desktop-environments/awesomewm

    ../../../services/audio.nix
    ../../../services/wifi.nix

    ../../../programs/fonts.nix
    ../../../programs/gamemode.nix
    ../../../programs/steam.nix
    ../../../programs/general.nix
  ];
}
