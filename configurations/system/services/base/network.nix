{ ... }:

{
  networking.networkmanager = {
    enable = true;  # Easiest to use and most distros use this by default.
    #wifi.backend = "iwd";
    wifi.powersave = true;
    #dhcp = "dhcpcd";
    #dns = "systemd-resolved";
  };
}
