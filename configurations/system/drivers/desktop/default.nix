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

  # Pulseaudio needs to be disabled
  hardware.pulseaudio.enable = false;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput = {
    enable = true;
  };
}
