{ config, pkgs, ... }:

{
  security = {
    polkit = {
      enable = true;
    };

    rtkit = {
      enable = true;
    };
  };

 # Making a service file for gnome-polkit
  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };

  xdg = {
    portal = {
      enable = true;
      xdgOpenUsePortal = false;
      config.common.default = "*";
    };
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput = {
    enable = true;
  };

  programs = {
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-volman
      ];
    };
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
    };
  };

  location = {
    latitude = 52.3;
    longitude = 4.9;
  };

  services = {
    tumbler.enable = true;
    gvfs.enable = true;
  };

}
