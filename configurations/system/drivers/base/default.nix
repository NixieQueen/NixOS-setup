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

  hardware = {
    # Xone controller support
    xone.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput = {
    enable = true;
  };

  programs = {
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
    };
  };

  location = {
    latitude = 52.3;
    longitude = 4.9;
  };
}
