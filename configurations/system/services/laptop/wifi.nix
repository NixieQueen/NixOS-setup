{ config, pkgs, ... }:

{
  networking.networkmanager = {
    enable = true;  # Easiest to use and most distros use this by default.
    #wifi.backend = "iwd";
    wifi.powersave = true;
    dhcp = "dhcpcd";
  };

  networking.dhcpcd = {
    enable = true;
  };

  networking.useDHCP = false;
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
