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
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
      ];
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
    printing = {
      enable = true;
      drivers = [ pkgs.cnijfilter2 pkgs.gutenprint pkgs.hplipWithPlugin ];
    };
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
      publish = {
        enable = true;
        addresses = true;
        userServices = true;
      };
    };

    samba = {
      enable = true;
      settings = {
        global = {
          security = "user";
          workgroup = "CBH";
        };
      };
      openFirewall = true;
    };
    tumbler.enable = true;
    gvfs.enable = true;
    redshift = {
      enable = true;
      executable = "/bin/redshift-gtk";
      brightness = {
        day = "1";
        night = "1";
      };
      temperature = {
        day = 5700;
        night = 1600;
      };
    };
  };

}
