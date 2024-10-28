{ config, lib, pkgs, ... }:

{
  services.displayManager = {
    defaultSession = "none+awesome";
  };

  services.xserver = {
    windowManager = {
      awesome = {
        enable = true;
        package = pkgs.awesome-git;
        luaModules = with pkgs.luaPackages; [
          luarocks
        ];
      };
    };
  };
}
