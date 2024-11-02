{ config, ... }:
let
  #hostname = "hyprNixieLaptop";
  hostname = "awesomeNixieLaptop";
in
{
  networking = {
    hostName = hostname;
    firewall = {
      enable = true;
      allowPing = true;
    };
  };
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
}
