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

  environment.systemPackages = with pkgs; [
    brightnessctl
  ];
  
  hardware.sane = {
    enable = true;
    extraBackends = [ pkgs.hplipWithPlugin ];
  };
}
