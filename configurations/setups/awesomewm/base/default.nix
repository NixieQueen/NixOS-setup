{ configType ? "laptop" , hostname ? "nixieFramework", user, pkgs, lib, config, ... }:

{
  import = [
    (import ../../configurations/system {hostnameNT = hostname;})
    (import ../../configurations/hardware {configType = configType;})
    ../../configurations/users/${user}/${user}.nix
      (import ../../configurations/drivers {configType = configType;})
      (import ../../configurations/desktop-environments {useWayland = false;})
      ../../configurations/desktop-environments/awesomewm

      ../../configurations/services/audio.nix
      ../../configurations/services/wifi.nix

      ../../configurations/programs/fonts.nix
      ../../configurations/programs/gamemode.nix
      ../../configurations/programs/steam.nix
      ../../configurations/programs/general.nix
  ];
}
