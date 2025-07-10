{ config, pkgs, ... }:

{
  services.resolved = {
    enable = false;
    dnssec = "true";
    domains = [ "~." ];
    dnsovertls = "true";
  };

  networking.networkmanager = {
    enable = true;  # Easiest to use and most distros use this by default.
    #wifi.backend = "iwd";
    wifi.powersave = true;
    #dhcp = "dhcpcd";
    #dns = "systemd-resolved";
  };

  networking.wireless.iwd = {
    enable = false;
    settings = {
      IPv6.Enabled = true;
      Settings.AutoConnect = true;
    };
  };

  #networking.dhcpcd = {
  #  enable = true;
  #};

  #networking.useDHCP = true;
  #networking.wireless = {
  #  iwd = {
  #    enable = true;
  #    settings = {
  #      Security = {
  #        EAP-Method="PEAP";
  #        EAP-PEAP-Phase2-Identity="s1136622@student.hsleiden.nl";
  #        EAP-PEAP-Phase2-Method="MSCHAPV2";
  #      };
  #      Network = {
  #        NameResolvingService="systemd";
  #      };
  #      IPv6.Enabled = true;
  #      Settings.AutoConnect = true;
  #    };
  #  };
  #};
}
