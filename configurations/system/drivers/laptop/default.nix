{ config, pkgs, ... }:

{
  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput = {  # X11 based
    touchpad = {
      tapping = true;
      naturalScrolling = false;
      disableWhileTyping = true;
    };
  };

  programs = {
    light.enable = true;
  };

  hardware.sane = {
    enable = true;
    extraBackends = [ pkgs.hplipWithPlugin ];
  };

}
