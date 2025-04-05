{ config, lib, pkgs, ... }:

{
  services.displayManager = {
    defaultSession = "none+awesome";
  };

  environment.systemPackages = with pkgs; [
    xdg-desktop-portal-gtk
  ];

  xdg.portal.extraPortals = with pkgs; [
    xdg-desktop-portal-gtk
  ];

  services.xserver = {
    windowManager = {
      awesome = {
        enable = true;
        package = pkgs.awesome-git;
        luaModules = with pkgs; [
          luaPackages.luarocks
          lua-pam
        ];
      };
    };
  };
}
