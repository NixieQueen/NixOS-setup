{ config, lib, pkgs, ... }:

{
  services.xserver = {
    displayManager = {
      gdm.enable = false;
      #defaultSession = "none+awesome";
      defaultSession = "hyprland";
      lightdm = {
        background = "/home/nixie/.config/awesome/themes/nixie-theme/backgrounds/MountainDragon.png";
        enable = true;
        greeters.slick = {
          enable = true;
          draw-user-backgrounds = true;
          extraConfig = "background=/home/nixie/.config/awesome/themes/nixie-theme/backgrounds/MountainDragon.png";
          iconTheme = {
            name = "Papirus-Dark";
            package = pkgs.papirus-icon-theme;
          };
          theme = {
            package = pkgs.gnome-themes-extra;
            name = "Adwaita";
            #name = "palenight";
            #package = pkgs.palenight-theme;
          };
          cursorTheme = {
            name = "Numix-Cursor";
            package = pkgs.numix-cursor-theme;
          };
          font = {
            package = pkgs.fira-code;
          };
        };
      };
    };
  };
}
